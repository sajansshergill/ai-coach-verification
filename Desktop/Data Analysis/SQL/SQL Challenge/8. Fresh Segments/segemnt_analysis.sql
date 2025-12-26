SELECT *
INTO #interest_metrics_edited
FROM interest_metrics
WHERE interest_id NOT IN (SELECT interest_id
                        FROM interest_metrics
                        WHERE interest_id IS NOT NULL
                        GROUP BY interest_id
                        HAVING COUNT(DISTINCT month_year) < 6);

-- Q1. Using our filtered dataset by removing the interests with less than 6 months worth of data,
--      whch are the top 10 and bottom 10 interests which have the largest composition values in any month_year?
--      Only use the maximum compostion value for each interest but you must keep the correspoding month_year
WITH cte_max_composition as (SELECT month_year,
                                    interest_id,
                                    MAX(composition) OVER (PARTITION BY interest_id) AS largest_composition
                            FROM #interest_metrics_edited -- filtered dataset in which interests with less than 6 months are removed
                            WHERE month_year IS NOT null
                            ),
    cte_max_composition_rank AS (SELECT *,
                                        DENSE_RANK() OVER (ORDER BY largets_composition DESC) AS rnk
                                FROM cte_max_composition
                                )

-- Top 10 interests
SELECT DISTINCT cr.interest_id,
                im.interest_name,
                cr.rnk
FROM cte_composition_rank AS cr
    JOIN interest_map AS im
        ON cr.interest_id = im.id
WHERE cr.rnk <= 10
ORDER BY cr.rnk;

-- Bottom 10 interests
SELECT DISTINCT TOP 10 cr.interest_id,
                        im.interest_name,
                        cr.rnk
FROM cte_composition_rank AS cr
    JOIN interest_map AS im
        ON cr.interest_id = im.id
ORDER BY cr.rnk DESC;

-- Q2. Which 5 interest had the lowedt average ranking value?
SELECT TOP 5 metrics.interes_id,
                map.interest_name,
                CAST(AVG(1.0 * metrics.ranking) AS DECIMAL(10, 2)) AS avg_ranking
FROM #interest_metrics_edited AS metrics
    JOIN interest_map AS map
        ON metrics.interest_id = map.id
GROUP BY metrcs.interest_id, map.interest_name
ORDER BY avg_ranking;

-- Q3. Which 5 interests had the largest standar deviation in their percentile_ranking values?
SELECT DISTINCT TOP 5 metrics.interest_id,
                        map.interest_name,
                        ROUND(STDEV(metrics.percentile ranking)
                                OVER(PARTITION BY metrics.interest_id), 2) ASstd_percentile_ranking
FROM #interest_metrics_edited AS metrics
    JOIN interest_map AS map
        ON metrics.interest_id = map.id
ORDER BY std_percentile_ranking desc;

-- Q4. For the 5 interests found in the previous question
--      - WHAT WAS MINIMUM and maximum percentile_ranking values for each interest and its corresponding year_month value?
--      Can you describe what is happening for these 5 interests?
WITH cte_largest_std_interests AS (SELECT DISTINCT TOP 5 metrics.interest_id,
                                                            map.interest_name,
                                                            map.interst_summary,
                                                            ROUND(STDEV(metrics.percentile_ranking)
                                                                    OVER(PARTITION BY metrics.interest_id), 2) AS std_percentile_ranking
                                    FROM #interest_metrics_edited AS metrics
                                        JOIN interest_map AS map
                                            ON metrics.interest_id = map.id
                                    ORDER BY std_percentile_ranking DESC
                                    ),
    cte_max_min_percentiles AS (SELECT lsi.interest_id,
                                        lsi.interest_name,
                                        lsi.interest_summary,
                                        ime.month_year,
                                        ime.percentile_ranking,
                                        MAX(ime.percentile_ranking) OVER (PARTITION BY lsi.interest_id) AS max_pct_rnk,
                                        MIN(ime.percentile_ranking) OVER (PARTITION BY lsi.interest_id) AS min_pct_rnk
                                FROM cte_largest_std_interests AS lsi
                                    JOIN #interest_metrics_edited AS ime
                                        ON lsi.interest_id = ime.interest_id
                                )
SELECT interest_id,
        interest_name,
        interest_summary,
        MAX(CASE WHEN percentile_ranking = max_pct_rnk THEN month_year END) AS max_pct_month_year,
        MAX(CASE WHEN percentile_ranking = max_pct_rnk THEN percentile_ranking END) AS max_pct_rnk,
        MIN(CASE WHEN percentile_ranking = min_pct_rnk THEN month_year end) AS min_pct_month_year,
        MIN(CASE WHEN percentile_ranking = min_pct_rnk THEN percentile_ranking END) AS min_pct_rnk
FROM cte_max_min_percentiles
GROUP BY interest_id,
            interest_name,
            interest_summary;

-- Q5. How would you describe our cutomers in this segment based off their compostion and ranking values?
--      WHat sort of products or service show we show to these customers and what should we avoid?
WITH cte_largest_std_interests AS (
    SELECT TOP 5 DISTINCT
        metrics.interest_id,
        map.interest_name,
        map.interest_summary,
        ROUND(
            STDEV(metrics.percentile_ranking)
                OVER (PARTITION BY metrics.interest_id),
            2
        ) AS std_percentile_ranking
    FROM #interest_metrics_edited AS metrics
    JOIN interest_map AS map
        ON metrics.interest_id = map.id
    ORDER BY std_percentile_ranking DESC
)
SELECT 
    lsi.interest_id,
    lsi.interest_name,
    lsi.interest_summary,
    COUNT(DISTINCT m.month_year) AS active_months,
    CAST(AVG(1.0 * m.composition) AS DECIMAL(10,2)) AS avg_composition,
    CAST(MAX(1.0 * m.composition) AS DECIMAL(10,2)) AS max_composition,
    CAST(AVG(1.0 * m.ranking) AS DECIMAL(10,2)) AS avg_ranking,
    MIN(m.ranking) AS min_ranking,
    MAX(m.ranking) AS max_ranking,
    CAST(STDEV(1.0 * m.percentile_ranking) AS DECIMAL(10,2)) AS std_percentile_ranking
FROM cte_largest_std_interests AS lsi
JOIN #interest_metrics_edited AS m
    ON lsi.interest_id = m.interest_id
GROUP BY 
    lsi.interest_id,
    lsi.interest_name,
    lsi.interest_summary
ORDER BY 
    std_percentile_ranking DESC;