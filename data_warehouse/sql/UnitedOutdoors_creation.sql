IF EXISTS (
    SELECT name
    FROM master.dbo.sysdatabases
    WHERE name = N'UnitedOutdoors'
)
BEGIN
    ALTER DATABASE UnitedOutdoors SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE UnitedOutdoors
END
GO

CREATE DATABASE UnitedOutdoors
GO

USE UnitedOutdoors;

CREATE TABLE Products (
    ProductSK INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    ProductID INT,
    ProductName NVARCHAR(50),
    SupplierID INT,
    CategoryID INT,
    QuantityPerUnit NVARCHAR(30),
    UnitPrice MONEY,
    UnitsInStock INT,
    UnitsOnOrder INT,
    ReorderLevel INT,
    Discontinued BIT,
    Description NVARCHAR(MAX),
    ProdSize NVARCHAR(50),
    Color VARCHAR(15),
    Quantity INT,
    picture_name VARCHAR(50),
    Category VARCHAR(20),
    Name VARCHAR(50),
    ProductNumber VARCHAR(25),
    MakeFlag BIT,
    FinishedGoodsFlag BIT,
    SafetyStockLevel INT,
    ReorderPoint INT,
    StandardCost DECIMAL(8,4),
    ListPrice MONEY,
    Size VARCHAR(5),
    SizeUnitMeasureCode CHAR(2),
    WeightUnitMeasureCode VARCHAR(3),
    Weight DECIMAL(8,2),
    DaysToManufacture INT,
    ProductLine CHAR(1),
    Class CHAR(1),
    Style CHAR(1),
    ProductSubcategoryID INT,
    ProductModelID INT,
    SellStartDate DATE,
    SellEndDate DATE,
    DiscontinuedDate DATE,
    rowguid UNIQUEIDENTIFIER NULL,
    ModifiedDate DATE,
    ProductCategoryID INT,
    ProductDescriptionID INT,
    CatalogDescription XML,
    Instructions XML,
    IllustrationID INT,
    CultureID VARCHAR(10),
    ProductPhotoID INT,
    ThumbNailPhotoHexString NVARCHAR(MAX),
    ThumbNailPhoto VARBINARY(MAX),
    ThumbnailPhotoFileName NVARCHAR(50),
    LargePhotoHexString NVARCHAR(MAX),
    LargePhoto VARBINARY(MAX),
    LargePhotoFileName NVARCHAR(50),
    "Primary" BIT
);

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
GO

CREATE TABLE Departments(
    DEPARTMENT_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    DEPARTMENT_DEPARTMENT_dept_id INT,
    DEPARTMENT_DEPARTMENT_dept_name VARCHAR(100),
    DEPARTMENT_DEPARTMENT_group_name VARCHAR(100),
    DEPARTMENT_DEPARTMENT_dept_head_id INT,
    DEPARTMENT_datetime_added DATETIME DEFAULT GETUTCDATE(),
    DEPARTMENT_source_database VARCHAR(100)
);
GO

CREATE TABLE Person(
    PERSON_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    PERSON_PERSON_BusinessEntityID INT,
    PERSON_PERSON_PersonType VARCHAR(100),
    PERSON_PERSON_NameStyle BIT,
    PERSON_PERSON_Title VARCHAR(100),
    PERSON_PERSON_FirstName VARCHAR(100),
    PERSON_PERSON_MiddleName VARCHAR(100),
    PERSON_PERSON_LastName VARCHAR(100),
    PERSON_PERSON_Suffix VARCHAR(100),
    PERSON_PERSON_EmailPromotion INT,
    PERSON_PERSON_AdditionalContactInfo XML,
    PERSON_PERSON_Demographics XML,
    PERSON_PERSONPHONE_PhoneNumber VARCHAR(100),
    PERSON_PHONENUMBERTYPE_PhoneNumberTypeID INT,
    PERSON_PHONENUMBERTYPE_Name VARCHAR(100),
    PERSON_EMAILADDRESS_EmailAddressID INT,
    PERSON_EMAILADDRESS_EmailAddress VARCHAR(100),
    PERSON_PASSWORD_PasswordHash VARBINARY(8000),
    PERSON_PASSWORD_PasswordSalt VARBINARY(8000),
    PERSON_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE BusinessEntityContact(
    BUSINESSENTITYCONTACT_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    BUSINESSENTITYCONTACT_BUSINESSENTITYCONTACT_BusinessEntityID INT,
    BUSINESSENTITYCONTACT_BUSINESSENTITYCONTACT_PersonID INT,
    BUSINESSENTITYCONTACT_CONTACTTYPE_ContactTypeID INT,
    BUSINESSENTITYCONTACT_CONTACTTYPE_Name VARCHAR(100),
    BUSINESSENTITYCONTACT_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE BusinessEntityAddress(
    BUSINESSENTITYADDRESS_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    BUSINESSENTITYADDRESS_BUSINESSENTITYADDRESS_BusinessEntityID INT,
    BUSINESSENTITYADDRESS_ADDRESSTYPE_AddressTypeID INT,
    BUSINESSENTITYADDRESS_ADDRESSTYPE_Name VARCHAR(100),
    BUSINESSENTITYADDRESS_ADDRESS_AddressID INT,
    BUSINESSENTITYADDRESS_ADDRESS_AddressLine1 VARCHAR(100),
    BUSINESSENTITYADDRESS_ADDRESS_AddressLine2 VARCHAR(100),
    BUSINESSENTITYADDRESS_ADDRESS_City VARCHAR(100),
    BUSINESSENTITYADDRESS_ADDRESS_POSTALCODE VARCHAR(100),
    BUSINESSENTITYADDRESS_ADDRESS_SpatialLocation GEOGRAPHY,
    BUSINESSENTITYADDRESS_STATEPROVINCE_StateProvinceID INT,
    BUSINESSENTITYADDRESS_STATEPROVINCE_StateProvinceCode VARCHAR(100),
    BUSINESSENTITYADDRESS_STATEPROVINCE_IsOnlyStateProvinceFlag BIT,
    BUSINESSENTITYADDRESS_STATEPROVINCE_Name VARCHAR(100),
    BUSINESSENTITYADDRESS_STATEPROVINCE_TerritoryID INT,
    BUSINESSENTITYADDRESS_COUNTRYREGION_CountryRegionCode CHAR(2),
    BUSINESSENTITYADDRESS_COUNTRYREGION_Name VARCHAR(100),
    BUSINESSENTITYADDRESS_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TRIGGER ConvertHexToVarbinary
ON Products
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE Products
    SET ThumbNailPhoto = CASE
                            WHEN inserted.ThumbNailPhotoHexString IS NOT NULL
                            THEN CONVERT(VARBINARY(MAX), inserted.ThumbNailPhotoHexString, 1)
                            ELSE Products.ThumbNailPhoto
                         END,
        LargePhoto = CASE
                        WHEN inserted.LargePhotoHexString IS NOT NULL
                        THEN CONVERT(VARBINARY(MAX), inserted.LargePhotoHexString, 1)
                        ELSE Products.LargePhoto
                     END
    FROM inserted
    WHERE inserted.ProductSK = Products.ProductSK
END;