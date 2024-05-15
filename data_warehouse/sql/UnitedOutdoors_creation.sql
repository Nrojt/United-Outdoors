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

CREATE TABLE Product (
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

CREATE TABLE Region(
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

CREATE TABLE Customer(
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

CREATE TABLE Department(
    DEPARTMENT_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    DEPARTMENT_DEPARTMENT_DeptID INT,
    DEPARTMENT_DEPARTMENT_DeptName VARCHAR(100),
    DEPARTMENT_DEPARTMENT_GroupName VARCHAR(100),
    DEPARTMENT_DEPARTMENT_DeptHeadId INT,
    DEPARTMENT_source_database VARCHAR(100),
    DEPARTMENT_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE Person(
    PERSON_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    PERSON_PERSON_BusinessEntityID INT NOT NULL,
    PERSON_PERSON_PersonType CHAR(2),
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

CREATE TABLE BusinessEntity(
    BUSINESSENTITY_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    BUSINESSENTITY_BUSINESSENTITY_BusinessEntityID INT,
    BUSINESSENTITY_BUSINESSENTITYCONTACT_PersonID INT,
    BUSINESSENTITY_CONTACTTYPE_ContactTypeID INT,
    BUSINESSENTITY_CONTACTTYPE_Name VARCHAR(100),
    BUSINESSENTITY_datetime_added DATETIME DEFAULT GETUTCDATE()
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
    BUSINESSENTITYADDRESS_ADDRESS_StateProvinceID INT,
    BUSINESSENTITYADDRESS_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE JobCandidate(
    JOBCANDIDATE_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    JOBCANDIDATE_JOBCANDIDATE_JobCandidateID INT,
    JOBCANDIDATE_JOBCANDIDATE_BusinessEntityID INT,
    JOBCANDIDATE_JOBCANDIDATE_Resume XML,
    JOBCANDIDATE_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE EmployeeDepartmentHistory(
    EMPLOYEEDEPARTMENTHISTORY_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    EMPLOYEEDEPARTMENTHISTORY_EMPLOYEEDEPARTMENTHISTORY_BusinessEntityID INT,
    EMPLOYEEDEPARTMENTHISTORY_EMPLOYEEDEPARTMENTHISTORY_DepartmentID INT,
    EMPLOYEEDEPARTMENTHISTORY_EMPLOYEEDEPARTMENTHISTORY_ShiftID INT,
    EMPLOYEEDEPARTMENTHISTORY_EMPLOYEEDEPARTMENTHISTORY_StartDate DATE,
    EMPLOYEEDEPARTMENTHISTORY_EMPLOYEEDEPARTMENTHISTORY_EndDate DATE,
    EMPLOYEEDEPARTMENTHISTORY_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE EmployeePayHistory(
    EMPLOYEEPAYHISTORY_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    EMPLOYEEPAYHISTORY_EMPLOYEEPAYHISTORY_BusinessEntityID INT,
    EMPLOYEEPAYHISTORY_EMPLOYEEPAYHISTORY_RateChangeDate DATE,
    EMPLOYEEPAYHISTORY_EMPLOYEEPAYHISTORY_Rate MONEY,
    EMPLOYEEPAYHISTORY_EMPLOYEEPAYHISTORY_PayFrequency INT,
    EMPLOYEEPAYHISTORY_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE Shift(
    SHIFT_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    SHIFT_SHIFT_ShiftID INT,
    SHIFT_SHIFT_Name VARCHAR(100),
    SHIFT_SHIFT_StartTime TIME,
    SHIFT_SHIFT_EndTime TIME,
    SHIFT_datetime_added DATETIME DEFAULT GETUTCDATE()
);

CREATE TABLE SalesPerson(
    SALESPERSON_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    SALESPERSON_SALESPERSON_BusinessEntityID INT,
    SALESPERSON_SALESPERSON_TerritoryID INT,
    SALESPERSON_SALESPERSON_SalesQuota MONEY,
    SALESPERSON_SALESPERSON_Bonus MONEY,
    SALESPERSON_SALESPERSON_CommissionPct DECIMAL(8,4),
    SALESPERSON_SALESPERSON_SalesYTD MONEY,
    SALESPERSON_SALESPERSON_SalesLastYear MONEY,
    SALESPERSON_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE ProductVendor(
    PRODUCTVENDOR_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    PRODUCTVENDOR_PRODUCTVENDOR_ProductID INT,
    PRODUCTVENDOR_PRODUCTVENDOR_BusinessEntityID INT,
    PRODUCTVENDOR_PRODUCTVENDOR_AverageLeadTime INT,
    PRODUCTVENDOR_PRODUCTVENDOR_StandardPrice MONEY,
    PRODUCTVENDOR_PRODUCTVENDOR_LastReceiptCost MONEY,
    PRODUCTVENDOR_PRODUCTVENDOR_LastReceiptDate DATE,
    PRODUCTVENDOR_PRODUCTVENDOR_MinOrderQty INT,
    PRODUCTVENDOR_PRODUCTVENDOR_MaxOrderQty INT,
    PRODUCTVENDOR_PRODUCTVENDOR_OnOrderQty INT,
    PRODUCTVENDOR_PRODUCTVENDOR_UnitMeasureCode CHAR(3),
    PRODUCTVENDOR_PRODUCTVENDOR_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE CustomerCustomerDemo(
    CUSTOMERCUSTOMERDEMO_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CUSTOMERCUSTOMERDEMO_CUSTOMERCUSTOMERDEMO_CustomerID NVARCHAR(10),
    CUSTOMERCUSTOMERDEMO_CUSTOMERCUSTOMERDEMO_CustomerTypeID NVARCHAR(10),
    CUSTOMERCUSTOMERDEMO_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE CustomerDemographics(
    CUSTOMERDEMOGRAPHICS_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CUSTOMERDEMOGRAPHICS_CUSTOMERDEMOGRAPHICS_CustomerTypeID NVARCHAR(10),
    CUSTOMERDEMOGRAPHICS_CUSTOMERDEMOGRAPHICS_CustomerDesc NVARCHAR(100),
    CUSTOMERDEMOGRAPHICS_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE SalesTerritoryHistory(
    SALESTERRITORYHISTORY_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    SALESTERRITORYHISTORY_SALESTERRITORYHISTORY_BusinessEntityID INT,
    SALESTERRITORYHISTORY_SALESTERRITORYHISTORY_TerritoryID INT,
    SALESTERRITORYHISTORY_SALESTERRITORYHISTORY_StartDate DATE,
    SALESTERRITORYHISTORY_SALESTERRITORYHISTORY_EndDate DATE,
    SALESTERRITORYHISTORY_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE ProductListPriceHistory(
    PRODUCTLISTPRICEHISTORY_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    PRODUCTLISTPRICEHISTORY_PRODUCTLISTPRICEHISTORY_ProductID INT,
    PRODUCTLISTPRICEHISTORY_PRODUCTLISTPRICEHISTORY_StartDate DATE,
    PRODUCTLISTPRICEHISTORY_PRODUCTLISTPRICEHISTORY_EndDate DATE,
    PRODUCTLISTPRICEHISTORY_PRODUCTLISTPRICEHISTORY_ListPrice MONEY,
    PRODUCTLISTPRICEHISTORY_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE ProductCostHistory(
    PRODUCTCOSTHISTORY_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    PRODUCTCOSTHISTORY_PRODUCTCOSTHISTORY_ProductID INT,
    PRODUCTCOSTHISTORY_PRODUCTCOSTHISTORY_StartDate DATE,
    PRODUCTCOSTHISTORY_PRODUCTCOSTHISTORY_EndDate DATE,
    PRODUCTCOSTHISTORY_PRODUCTCOSTHISTORY_StandardCost MONEY,
    PRODUCTCOSTHISTORY_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE Culture(
    CULTURE_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CULTURE_CULTURE_CultureID VARCHAR(10),
    CULTURE_CULTURE_Name VARCHAR(100),
    CULTURE_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TRIGGER ConvertHexToVarbinary
ON Product
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE Product
    SET ThumbNailPhoto = CASE
                            WHEN inserted.ThumbNailPhotoHexString IS NOT NULL
                            THEN CONVERT(VARBINARY(MAX), inserted.ThumbNailPhotoHexString, 1)
                            ELSE Product.ThumbNailPhoto
                         END,
        LargePhoto = CASE
                        WHEN inserted.LargePhotoHexString IS NOT NULL
                        THEN CONVERT(VARBINARY(MAX), inserted.LargePhotoHexString, 1)
                        ELSE Product.LargePhoto
                     END
    FROM inserted
    WHERE inserted.ProductSK = Product.ProductSK
END;