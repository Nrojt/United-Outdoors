IF NOT EXISTS (
    SELECT name
    FROM master.dbo.sysdatabases
    WHERE name = N'UnitedOutdoors'
)
CREATE DATABASE UnitedOutdoors
GO

USE UnitedOutdoors;

CREATE TABLE Regions(
    RegionSK INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    RegionID INT,
    RegionName VARCHAR(10),
    StateProvinceID INT,
    StateProvinceCode VARCHAR(10),
    CountryRegionCode CHAR(2),
    IsOnlyStateProvinceFlag BIT,
    Name VARCHAR(50),
    TerritoryID INT,
    rowguid UNIQUEIDENTIFIER NULL,
    ModifiedDate DATE
);

CREATE TABLE Customers(
    CustomerSK INT PRIMARY KEY IDENTITY(1,1) NOT NULL ,
    CustomerID NVARCHAR(10) NOT NULL,
    CompanyName NVARCHAR(40),
    ContactName NVARCHAR(60),
    ContactTitle NVARCHAR(30),
    Address NVARCHAR(60),
    City NVARCHAR(30),
    Region VARCHAR(15),
    Zip  VARCHAR(10),
    Country VARCHAR(15),
    Phone VARCHAR(24),
    Fax VARCHAR(24),
    CustomerTypeID VARCHAR,
    CustomerDesc VARCHAR(100),
    State CHAR(2),
    PersonID INT,
    StoreID INT,
    TerritoryID INT,
    AccountNumber CHAR(10),
    PersonType VARCHAR(2),
    NameStyle BIT,
    Title VARCHAR(10),
    Suffix VARCHAR(10),
    EmailPromotion INT,
    AdditionalContactInfo XML,
    Demographics XML,
    AddressID INT,
    AddressTypeID INT,
    AddressLine2 VARCHAR(60),
    StateProvinceID INT,
    SpatialLocation GEOGRAPHY,
    AddressType VARCHAR(50),
    StateProvinceCode VARCHAR(10),
    CountryRegionCode CHAR(2),
    IsOnlyStateProvinceFlag BIT,
    StateProvince VARCHAR(50),
    CountryRegion VARCHAR(50)
);