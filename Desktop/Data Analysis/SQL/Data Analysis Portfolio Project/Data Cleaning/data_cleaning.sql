/*
    Cleaning Data in SQL Queries
*/

SELECT *
FROM PortfolioProject..NashvilleHousing

--------------------------------------------------------------------------------------------------------------------------
-- Standarize Data Format
-- To get information about a specific table

exec sp_help NashvilleHousing

SELECT SaleDate,
        CONVERT(DATE, SaleDate)
FROM PortfolioProject..NashvilleHousing

UPDATE PortfolioProject..NashvilleHousing
SET SaleDate = CONVERT(Date, SaleDate)

-- It doesn't change permanently. Therefor a new column was added.
ALTER TABLE PortfolioProject..NashvilleHousing
ADD SaleDateConverted DATE

UPDATE PortfolioProject..NashvilleHousing
SET SaleDateConverted = CONVERT(Date, SaleDate)


--------------------------------------------------------------------------------------------------------------------------
--Populate Property Address data
-- There are some roles that have null property Address. We are trying to fill it with values by ParcelId.

SELECT *
FROM PortfolioProject..NashvilleHousing
WHERE PropertyAddress IS null

SELECT a.ParcelId
        a.PropertyAddress,
        b.ParcelId,
        b.PropertyAddress,
        ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM PortfolioProject..NashvilleHousing AS a
    JOIN PortfolioProject..NashvilleHousing AS b
        ON a.ParcelId = b.ParcelId
        AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress IS null

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM PortfolioProject..NashvilleHousing a
    JOIN PortfolioProject..NashvilleHousing b 
        ON a.ParcelId = b.ParcelId
        AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress IS null

--------------------------------------------------------------------------------------------------------------------------
-- Breaking out Address into Individual Columns (Address, City, State)

SELECT PropertyAddress,
        SUBSTRING(PropertyAddress, 0, CHARINDEX(',', PropertyAddress)) AS Address,
        SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress)) AS City
FROM PortfolioProject.dbo.NashvilleHousing

ALTER TABLE NashvilleHousing
ADD PropertySplitAddress Nvarchar(255),
    PropertySplitCity Nvarchar(255);

Update NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1),
    PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress));


SELECT *
FROM PortfolioProject.dbo.NashvilleHousing

-- Another way to splt by delimeter
SELECT PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3),
        PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
        PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
FROM PortfolioProject.dbo.NashvilleHousing

ALTER TABLE NashvilleHousing
ADD OwnerSplitAddress Nvarchar(255),
    OwnerSplitCity Nvarchar(255),
    OwnerSplitState Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3),
    OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
    OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1);

--------------------------------------------------------------------------------------------------------------------------
-- Change Y and N to Yes and No in "Sold vs Vacant" field
SELECT DISINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM PortfolioProject.dbo.NashvilleHousing
GROUP BY SoldAsVacant
ORDER BY SoldAsVacant

SELECT SoldAsVacant,
        CASE
            WHEN SoldAsVacant = 'Y' THEN 'YES'
            WHEN SoldAsVacant = 'N' THEN 'NO'
        END
FROM PortfolioProject.dbo.NashvilleHousing

UPDATE NashvilleHousing
SET SoldAsVacant = CASE
                        WHEN SoldAsVacant = 'Y' THEN 'YES'
                        WHEN SoldAsVacant = 'N' THEN 'NO'
                        ELSE SoldAsVacant
                    END

--------------------------------------------------------------------------------------------------------------------------
-- Remove Duplicates

WITH RowNumCTE AS(
    SELECT *,
    ROW_NUMBER() OVER (
        PARTITION BY ParcelId, PropertyAddress,
                        SalePrice, SaleDate, LegalReference
                        ORDER BY UniqueID) AS row_num
    FROM PortfolioProject.dbo.NashvilleHousing
        -- order by ParcelID
    )

-- DELETE Then SELECT
SELECT *
FROM RowNumCTE
WHERE row_num > 1
ORDER BY ParcelID

--------------------------------------------------------------------------------------------------------------------------
-- Delete Unused Columns

SELECT *
FROM PortfolioProject.dbo.NashvilleHousing

ALTER TABLE PortfolioProject.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate