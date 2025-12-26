SELECT *
FROM /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidDeaths.xlsx
ORDER BY 3, 4

SELECT * 
FROM /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidVaccinations.xlsx

-- Select Data that we are going to be starting with
SELECT location,
        date,
        total_cases,
        new_cases,
        total_deaths,
        population
FROM /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidDeaths.xlsx
ORDER BY 1, 2

-- Total Cases vs Total Deaths
-- SHows likelihood of dying of you contract covid in your country
SELECT location,
        date,
        total_cases,
        total_deaths,
        ROUND((total_deaths / total_cases) * 100, 5) AS DeathPercentage
FROM /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidDeaths.xlsx
ORDER BY 1,2

-- Total Cases vs Population
-- Shows what percentage of population infected with Covid
SELECT location,
        date,
        total_cases,
        population,
        (total_cases / population) * 100 AS PercentPopulationInfected
FROM /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidDeaths.xlsx
WHERE location LIKE '%turkey%'
ORDER BY 1,2

-- Countries with Highest Infection Rate compared to Population
SELECT location,
        Population,
        MAX(total_cases) AS HighestInfectionCount,
        MAX((total_cases / population)) * 100 AS PercentPopulationInfected
FROM /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidDeaths.xlsx
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC

-- Countries with Highest Death Count per Population
SELECT location,
        MAX(CAST(total_deaths AS int)) AS TotalDeathCount
FROM /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidDeaths.xlsx
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount DESC

-- BREAKING THINGS DOWN BY CONTINENT
-- Showing continents with the highest death count per population
SELECT continent,
        MAX(CAST(total_deaths AS int)) AS TotalDeathCount
FROM /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidDeaths.xlsx
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC

-- Global Total Cases, Deaths and Death Percentage
SELECT SUM(new_cases) AS total_cases,
        SUM(cast(new_deaths as int)) AS total_deaths,
        SUM(cast(new_deaths as int)) / SUM(new_cases) * 100 AS DeathPercentage
FROM /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidDeaths.xlsx
-- WHERE location lIKE '%turkey%'
WHERE continent IS NOT NULL
ORDER BY 1, 2

-- Total Population vs Vaccinations
-- Shows Percentage of Population that has received at least one Covid Vaccine
SELECT dea.population,
        dea.continent,
        dea.location,
        dea.date,
        vac.new_vaccinations,
        SUM(CONVERT(int, vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) AS RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
FROM /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidDeaths.xlsx AS dea
    JOIN /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidVaccinations.xlsx AS vac
        ON dea.location = vac.location
        AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2, 3

-- Using CTE to perform Calculation on Partition BY in previous query
WITH PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
AS(
    SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
    , SUM(CONVERT(int, vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) AS RollingPeopleVaccinated
    --, (RollingPeopleVaccinated/population)*100
    FROM /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidDeaths.xlsx dea
    JOIN /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidVaccinations.xlsx vac
        ON dea.location = vac.Location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL
    --order by 2,3
)
SELECT *, (RollingPeopleVaccinated / Population) * 100
FROM PopvsVac

-- Using Temp Table to perfrom Calculation on Partition By in previous query
DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated(
    Continent nvarchar(255),
    Location nvarchar(255),
    Date datetime,
    Population numeric,
    new_vaccinations numeric,
    RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
        SUM(CONVERT(int, vac.new_vaccinations)) OVER (Partiton by dea.Location Order by dea.location, dea.Date) AS RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
FROM /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidDeaths.xlsx dea
JOIN /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidVaccinations.xlsx vac
    ON dea.location = vac.location
    AND dea.date = vac.date
-- where dea.continent is not null
-- order by 2,3

SELECT *, (RollingPeopleVaccinated / Population) * 100
FROM #PercentPopulationVaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
        SUM(CONVERT(int, vac.new_vaccinations)) OVER (PARTITION BY dea.Location Order by dea.location, dea.Date) AS RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
FROM /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidDeaths.xlsx dea
JOIN /Users/sajanshergill/Desktop/SQL Projects/Data Analysis Portfolio Project/Data Exploration/CovidVaccinations.xlsx vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL