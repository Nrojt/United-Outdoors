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
    EMPLOYEE_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    EMPLOYEE_EMPLOYEE_EmployeeID INT, 
    EMPLOYEE_EMPLOYEE_DepartmentID INT,
    EMPLOYEE_EMPLOYEE_ManagerID INT,
    EMPLOYEE_EMPLOYEETERRITORIES_TerritoryID INT,
    EMPLOYEE_EMPLOYEE_Emp_Fname NVARCHAR(255),
    EMPLOYEE_EMPLOYEE_Emp_Lname NVARCHAR(255),
    EMPLOYEE_EMPLOYEE_Street NVARCHAR(150),
    EMPLOYEE_EMPLOYEE_City NVARCHAR(100),
    EMPLOYEE_EMPLOYEE_State CHAR(2),
    EMPLOYEE_EMPLOYEE_Zip_Code CHAR(5),
    EMPLOYEE_EMPLOYEE_Phone INT,
    EMPLOYEE_EMPLOYEE_Status CHAR(1),
    EMPLOYEE_EMPLOYEE_SS_Number INT,
    EMPLOYEE_EMPLOYEE_Salary INT,
    EMPLOYEE_EMPLOYEE_Start_Date DATE,
    EMPLOYEE_EMPLOYEE_Termination DATE,
    EMPLOYEE_EMPLOYEE_Birth_Date DATE,
    EMPLOYEE_EMPLOYEE_Bene_Health_Ins CHAR(1),
    EMPLOYEE_EMPLOYEE_Bene_Life_Ins CHAR(1),
    EMPLOYEE_EMPLOYEE_Bene_Day_Care CHAR(1),
    EMPLOYEE_EMPLOYEE_Sex CHAR(1), --F or M
    EMPLOYEE_BONUS_Bonus_Date DATE,
    EMPLOYEE_BONUS_Bonus_Amount INT,
    EMPLOYEE_EMPLOYEES_Title NVARCHAR(50),
    EMPLOYEE_EMPLOYEES_TitleOfCourtesy NVARCHAR(50),
    EMPLOYEE_EMPLOYEES_HireDate DATE,
    EMPLOYEE_EMPLOYEES_HomePhone NVARCHAR(20),
    EMPLOYEE_EMPLOYEES_Extension INT,
    EMPLOYEE_EMPLOYEES_Photo VARBINARY(MAX),
    EMPLOYEE_EMPLOYEES_PhotoPath NVARCHAR(255),
    EMPLOYEE_EMPLOYEES_Notes VARCHAR(MAX),
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
GO

CREATE TABLE Customer(
    CUSTOMER_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CUSTOMER_CUSTOMERS_ID INT,
    CUSTOMER_CUSTOMERS_CompanyName NVARCHAR(100),
    CUSTOMER_CUSTOMERS_ContactName NVARCHAR(255),
    CUSTOMER_CUSTOMERS_ContactTitle NVARCHAR(100),
    CUSTOMER_CUSTOMERS_Address NVARCHAR(255),
    CUSTOMER_CUSTOMERS_City NVARCHAR(100),
    CUSTOMER_CUSTOMERS_Region NVARCHAR(50),
    CUSTOMER_CUSTOMERS_PostalCode NVARCHAR(20),
    CUSTOMER_CUSTOMERS_Country NVARCHAR(150),
    CUSTOMER_CUSTOMERS_Phone NVARCHAR(24),
    CUSTOMER_CUSTOMERS_Fax NVARCHAR(24),
    CUSTOMER_CUSTOMER_Fname NVARCHAR(255),
    CUSTOMER_CUSTOMER_Lname NVARCHAR(255),
    CUSTOMER_CUSTOMER_State CHAR(2),
    CUSTOMER_CUSTOMER_PersonID INT,
    CUSTOMER_CUSTOMER_StoreID INT,
    CUSTOMER_CUSTOMER_TerritoryID INT,
    CUSTOMER_CUSTOMER_AccountNumber CHAR(10),
    CUSTOMER_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE Department(
    DEPARTMENT_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    DEPARTMENT_DEPARTMENT_DeptID INT,
    DEPARTMENT_DEPARTMENT_DeptName VARCHAR(100),
    DEPARTMENT_DEPARTMENT_GroupName VARCHAR(100),
    DEPARTMENT_DEPARTMENT_DeptHeadID INT,
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

CREATE TABLE SpecialOffer(
    SPECIALOFFER_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    SPECIALOFFER_SPECIALOFFER_ID INT,
    SPECIALOFFER_SPECIALOFFER_Description TEXT,
    SPECIALOFFER_SPECIALOFFER_DiscountPCT INT,
    SPECIALOFFER_SPECIALOFFER_Type NVARCHAR(100),
    SPECIALOFFER_SPECIALOFFER_Category NVARCHAR(100),
    SPECIALOFFER_SPECIALOFFER_StartDate DATE,
    SPECIALOFFER_SPECIALOFFER_EndDate DATE,
    SPECIALOFFER_SPECIALOFFER_MinQty INT,
    SPECIALOFFER_SPECIALOFFER_MaxQty INT,
    SPECIALOFFER_SPECIALOFFERPRODUCT_ProductID INT,
    SPECIALOFFER_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE CreditCard(
    CREDITCARD_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CREDITCARD_CREDITCARD_ID INT,
    CREDITCARD_CREDITCARD_CardType NVARCHAR(50),
    CREDITCARD_CREDITCARD_CardNumber BIGINT,
    CREDITCARD_CREDITCARD_ExpMonth INT,
    CREDITCARD_CREDITCARD_ExpYear INT,
    CREDITCARD_PERSONCREDITCARD_BusinessEntityID INT,
    CREDITCARD_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE Supplier(
    SUPPLIER_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    SUPPLIER_SUPPLIERS_SupplierID INT,
    SUPPLIER_SUPPLIERS_CompanyName NVARCHAR(100),
    SUPPLIER_SUPPLIERS_ContactName NVARCHAR(255),
    SUPPLIER_SUPPLIERS_ContactTitle NVARCHAR(100),
    SUPPLIER_SUPPLIERS_Address NVARCHAR(150),
    SUPPLIER_SUPPLIERS_City NVARCHAR(50),
    SUPPLIER_SUPPLIERS_Region NVARCHAR(50),
    SUPPLIER_SUPPLIERS_PostalCode NVARCHAR(20),
    SUPPLIER_SUPPLIERS_Country NVARCHAR(100),
    SUPPLIER_SUPPLIERS_Phone NVARCHAR(20),
    SUPPLIER_SUPPLIERS_Fax NVARCHAR(30),
    SUPPLIER_SUPPLIERS_HomePage NVARCHAR(255),
    SUPPLIER_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE Currency(
    CURRENCY_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CURRENCY_CURRENCY_CurrencyCode NVARCHAR(10),
    CURRENCY_CURRENCY_Name NVARCHAR(100),
    CURRENCY_COUNTRYREGIONCURRENCY_CountryRegionCode NVARCHAR(10),
    CURRENCY_CURRENCYRATE_CurrencyRateID INT,
    CURRENCY_CURRENCYRATE_CurrencyRateDate DATE,
    CURRENCY_CURRENCYRATE_FromCurrencyCode NVARCHAR(10),
    CURRENCY_CURRENCYRATE_ToCurrencyCode NVARCHAR(10),
    CURRENCY_CURRENCYRATE_AverageRate INT,
    CURRENCY_CURRENCYRATE_EndOfDayRate INT,
    CURRENCY_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE Territory(
    TERRITORY_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    TERRITORY_REGION_RegionID INT,
    TERRITORY_REGION_RegionDescription TEXT,
    TERRITORY_TERRITORIES_TerritoryID INT,
    TERRITORY_TERRITORIES_TerritoryDescription TEXT,
    TERRITORY_REGION_Region NVARCHAR(50),
    TERRITORY_STATE_StateID NVARCHAR(10),
    TERRITORY_STATE_StateName NVARCHAR(100),
    TERRITORY_STATE_StateCapital NVARCHAR(50),
    TERRITORY_STATE_Country NVARCHAR(50),
    TERRITORY_COUNTRYREGION_CountryRegionCode NVARCHAR(10),
    TERRITORY_COUNTRYREGION_Name NVARCHAR(100),
    TERRITORY_STATEPROVINCE_StateProvinceID INT,
    TERRITORY_STATEPROVINCE_StateProvinceCode NVARCHAR(10),
    TERRITORY_STATEPROVINCE_IsOnlyStateProvinceFlag CHAR(1),
    TERRITORY_STATEPROVINCE_Name NVARCHAR(100),
    TERRITORY_SALESTAXRATE_SalesTaxRateID INT,
    TERRITORY_SALESTAXRATE_TaxType NVARCHAR(50),
    TERRITORY_SALESTAXRATE_TaxRate DECIMAL(8,2),
    TERRITORY_SALESTAXRATE_Name NVARCHAR(150),
    TERRITORY_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE OrderHeader(
    ORDERHEADER_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    ORDERHEADER_SALESORDERDETAIL_SalesOrderID INT,
    ORDERHEADER_SALESORDERDETAIL_SalesOrderDetailID INT,
    ORDERHEADER_SALESORDERDETAIL_CarrierTrackingNumber NVARCHAR(25),
    ORDERHEADER_SALESORDERDETAIL_OrderQty INT,
    ORDERHEADER_SALESORDERDETAIL_ProductID INT,
    ORDERHEADER_SALESORDERDETAIL_SpecialOfferID INT,
    ORDERHEADER_SALESORDERDETAIL_UnitPrice DECIMAL(8,2),
    ORDERHEADER_SALESORDERDETAIL_UnitPriceDiscount DECIMAL(8,2),
    ORDERHEADER_SALESORDERDETAIL_LineTotal NVARCHAR(MAX),
    ORDERHEADER_SALESORDERHEADER_RevisionNumber INT,
    ORDERHEADER_SALESORDERHEADER_OrderDate DATE,
    ORDERHEADER_SALESORDERHEADER_DueDate DATE,
    ORDERHEADER_SALESORDERHEADER_ShipDate DATE,
    ORDERHEADER_SALESORDERHEADER_Status CHAR(1),
    ORDERHEADER_SALESORDERHEADER_OnlineOrderFlag BIT,
    ORDERHEADER_SALESORDERHEADER_SalesOrderNumber VARCHAR(100),
    ORDERHEADER_SALESORDERHEADER_PurchaseOrderNumber VARCHAR(25),
    ORDERHEADER_SALESORDERHEADER_AccountNumber NVARCHAR(15),
    ORDERHEADER_SALESORDERHEADER_CustomerID INT,
    ORDERHEADER_SALESORDERHEADER_SalesPersonID INT,
    ORDERHEADER_SALESORDERHEADER_TerritoryID INT,
    ORDERHEADER_SALESORDERHEADER_BillToAddress INT,
    ORDERHEADER_SALESORDERHEADER_ShipToAddress INT,
    ORDERHEADER_SALESORDERHEADER_ShipMethodID INT,
    ORDERHEADER_SALESORDERHEADER_CreditCardID INT,
    ORDERHEADER_SALESORDERHEADER_CreditCardApprovalCode NVARCHAR(15),
    ORDERHEADER_SALESORDERHEADER_CurrencyRateID INT,
    ORDERHEADER_SALESORDERHEADER_SubTotal DECIMAL(11,2),
    ORDERHEADER_SALESORDERHEADER_TaxAmt DECIMAL(11,2),
    ORDERHEADER_SALESORDERHEADER_Freight DECIMAL(11,2),
    ORDERHEADER_SALESORDERHEADER_TotalDue DECIMAL(11,2),
    ORDERHEADER_SALESORDERHEADER_Comment NVARCHAR(128),
    ORDERHEADER_SALESORDERHEADERSALESREASON_SalesOrderID INT,
    ORDERHEADER_SALESREASON_SalesReasonID INT,
    ORDERHEADER_SALESREASON_Name NVARCHAR(100),
    ORDERHEADER_SALESREASON_ReasonType NVARCHAR(100),
    ORDERHEADER_datetime_added DATETIME DEFAULT GETUTCDATE()
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