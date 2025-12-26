-- Q1. How many customers has Foodie-Fi ever had?
SELECT COUNT(DISTINCT(customer_id)) AS total_customers
FROM subscriptions

-- Q2. What is the monthly distribution of the trial plan start_date for our dataset - use the start of the month as the group by value
SELECT DATEPART(MONTH, s.start_date) AS start_month,
        DATENAME(MONTH, s.start_date) AS start_month_name,
        COUNT(*) AS trial_subscriptions
FROM subscriptions AS s
    JOIN plans AS p
        ON s.plan_id = p.plan_id
WHERE p.plan_name = 'trial'
GROUP BY DATEPART(MONTH, s.start_date),
            DATENAME(MONTH, s.start_date)
ORDER BY 1;

-- Q3. What plan start_date value occur after the year 2020 for our dataset? Show the breakdown by count of events for each plan_name
WITH plan_2021 AS (SELECT p.plan_id,
                            p.plan_name,
                            COUNT(*) AS total_2021
                    FROM subscriptions AS s
                        JOIN plans AS p
                            ON s.plan_id = p.plan_id
                    WHERE YEAR(start_date) > 2020
                    GROUP BY p.plan_name, p.plan_id
                    ),
    plan_2020 AS (SELECT p.plan_id,
                            p.plan_name,
                            COUNT(*) AS total_2020
                    FROM subscriptions AS s
                        JOIN plans AS p
                            ON s.plan_id = p.plan_id
                    WHERE YEAR(s.start_date) = 2020
                    GROUP BY p.plan_name,
                                p.plan_id
    )
SELECT a.*,
        b.total_2021
FROM plan_2020 AS a
    LEFT JOIN plan_2021 AS b
        ON a.plan_id = b.plan_id
ORDER BY 1;