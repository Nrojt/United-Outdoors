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

CREATE TABLE Employee (
    EMPLOYEE_sk INT PRIMARY KEY INDENTITY(1,1) NOT NULL,
    EMPLOYEE_EMPLOYEE_emp_id INT, 
    EMPLOYEE_EMPLOYEE_dept_id INT,
    EMPLOYEE_EMPLOYEETERRITORIES_TerritoryID INT,
    EMPLOYEE_EMPLOYEE_emp_fname VARCHAR(255),
    EMPLOYEE_EMPLOYEE_emp_lname VARCHAR(255),
    EMPLOYEE_EMPLOYEE_street VARCHAR(150),
    EMPLOYEE_EMPLOYEE_city VARCHAR(100),
    EMPLOYEE_EMPLOYEE_state CHAR(2),
    EMPLOYEE_EMPLOYEE_zip_code CHAR(5),
    EMPLOYEE_EMPLOYEE_phone INT,
    EMPLOYEE_EMPLOYEE_status CHAR(1),
    EMPLOYEE_EMPLOYEE_ss_number INT,
    EMPLOYEE_EMPLOYEE_salary INT,
    EMPLOYEE_EMPLOYEE_start_date DATE,
    EMPLOYEE_EMPLOYEE_termination DATE,
    EMPLOYEE_EMPLOYEE_birth_date DATE,
    EMPLOYEE_EMPLOYEE_bene_health_ins CHAR(1),
    EMPLOYEE_EMPLOYEE_bene_life_ins CHAR(1),
    EMPLOYEE_EMPLOYEE_bene_day_care CHAR(1),
    EMPLOYEE_EMPLOYEE_sex VARCHAR(1), --F or M
    EMPLOYEE_BONUS_bonus_date DATE,
    EMPLOYEE_BONUS_bonus_amount INT,
    EMPLOYEE_EMPLOYEES_Title VARCHAR(50),
    EMPLOYEE_EMPLOYEES_TitleOfCourtesy VARCHAR(50),
    EMPLOYEE_EMPLOYEES_HireDate DATE,
    EMPLOYEE_EMPLOYEES_HomePhone INT,
    EMPLOYEE_EMPLOYEES_Extension INT,
    EMPLOYEE_EMPLOYEES_Photo VARCHAR(150),
    EMPLOYEE_EMPLOYEES_PhotoPath VARCHAR(255),
    EMPLOYEE_EMPLOYEES_Notes TEXT,
    EMPLOYEE_datetime_added DATETIME DEFAULT GETUTCDATE()
)

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
    CUSTOMER_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CUSTOMER_CUSTOMERS_id INT,
    CUSTOMER_CUSTOMER_PersonID INT,
    CUSTOMER_CUSTOMER_StoreID INT,
    CUSTOMER_CUSTOMER_TerritoryID INT,
    CUSTOMER_CUSTOMER_AccountNumber CHAR(10),
    CUSTOMER_CUSTOMERS_CompanyName VARCHAR(100),
    CUSTOMER_CUSTOMERS_ContactName VARCHAR(255),
    CUSTOMER_CUSTOMERS_ContactTitle VARCHAR(100),
    CUSTOMER_CUSTOMERS_Address VARCHAR(255),
    CUSTOMER_CUSTOMERS_City VARCHAR(100),
    CUSTOMER_CUSTOMERS_Region VARCHAR(50),
    CUSTOMER_CUSTOMERS_PostalCode VARCHAR(20),
    CUSTOMER_CUSTOMERS_Country VARCHAR(150),
    CUSTOMER_CUSTOMERS_Phone VARCHAR(24),
    CUSTOMER_CUSTOMERS_Fax VARCHAR(24),
    CUSTOMER_CUSTOMER_fname VARCHAR(255),
    CUSTOMER_CUSTOMER_lname VARCHAR(255),
    CUSTOMER_CUSTOMER_state CHAR(2),
    CUSTOMER_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE Department(
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