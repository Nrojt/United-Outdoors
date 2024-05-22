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
    EMPLOYEE_EMPLOYEE_NationalIDNumber NVARCHAR(15),
    EMPLOYEE_EMPLOYEE_LoginID NVARCHAR(256),
    EMPLOYEE_EMPLOYEE_OrganizationNode NVARCHAR(MAX),
    EMPLOYEE_EMPLOYEE_OrganizationLevel INT,
    EMPLOYEE_EMPLOYEE_JobTitle NVARCHAR(50),
    EMPLOYEE_EMPLOYEE_BirthDate DATE,
    EMPLOYEE_EMPLOYEE_MaritalStatus CHAR(1),
    EMPLOYEE_EMPLOYEE_Gender CHAR(1),
    EMPLOYEE_EMPLOYEE_HireDate DATE,
    EMPLOYEE_EMPLOYEE_SalariedFlag BIT,
    EMPLOYEE_EMPLOYEE_VacationHours INT,
    EMPLOYEE_EMPLOYEE_SickLeaveHours INT,
    EMPLOYEE_EMPLOYEE_CurrentFlag BIT,
    EMPLOYEE_EMPLOYEES_LastName NVARCHAR(255),
    EMPLOYEE_EMPLOYEES_FirstName NVARCHAR(255),
    EMPLOYEE_EMPLOYEES_Title NVARCHAR(30),
    EMPLOYEE_EMPLOYEES_TitleOfCourtesy NVARCHAR(25),
    EMPLOYEE_EMPLOYEES_Address NVARCHAR(60),
    EMPLOYEE_EMPLOYEES_City NVARCHAR(20),
    EMPLOYEE_EMPLOYEES_Region NVARCHAR(15),
    EMPLOYEE_EMPLOYEES_PostalCode NVARCHAR(10),
    EMPLOYEE_EMPLOYEES_Country NVARCHAR(50),
    EMPLOYEE_EMPLOYEES_HomePhone NVARCHAR(24),
    EMPLOYEE_EMPLOYEES_Extension NVARCHAR(4),
    EMPLOYEE_EMPLOYEES_Photo VARBINARY(MAX),
    EMPLOYEE_EMPLOYEES_PhotoHexString NVARCHAR(MAX),
    EMPLOYEE_EMPLOYEES_Notes NVARCHAR(MAX),
    EMPLOYEE_EMPLOYEES_ReportsTo INT,
    EMPLOYEE_EMPLOYEES_PhotoPath NVARCHAR(255),
    EMPLOYEE_EMPLOYEES_TerritoryID INT,
    EMPLOYEE_EMPLOYEE_ManagerID INT,
    EMPLOYEE_EMPLOYEE_DeptID INT,
    EMPLOYEE_EMPLOYEE_Street NVARCHAR(150),
    EMPLOYEE_EMPLOYEE_State CHAR(2),
    EMPLOYEE_EMPLOYEE_Phone NVARCHAR(50),
    EMPLOYEE_EMPLOYEE_Status CHAR(1),
    EMPLOYEE_EMPLOYEE_SS_Number NVARCHAR(50),
    EMPLOYEE_EMPLOYEE_Salary MONEY,
    EMPLOYEE_EMPLOYEE_Start_Date DATE,
    EMPLOYEE_EMPLOYEE_Termination DATE,
    EMPLOYEE_EMPLOYEE_Bene_Health_Ins CHAR(1),
    EMPLOYEE_EMPLOYEE_Bene_Life_Ins CHAR(1),
    EMPLOYEE_EMPLOYEE_Bene_Day_Care CHAR(1),
    EMPLOYEE_EMPLOYEE_Sex CHAR(1),
    EMPLOYEE_BONUS_BonusID INT,
    EMPLOYEE_BONUS_Bonus_Date DATE,
    EMPLOYEE_BONUS_Bonus_Amount INT,
    EMPLOYEE_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE Date (
    DATE_ID INT NOT NULL PRIMARY KEY,
    DATE_Date DATE NOT NULL,
    DATE_Weekday VARCHAR(10) NOT NULL,
    DATE_WeekdayNum INT NOT NULL,
    DATE_DayMonth INT NOT NULL,
    DATE_DayOfYear INT NOT NULL,
    DATE_WeekOfYear INT NOT NULL,
    DATE_MonthNum INT NOT NULL,
    DATE_MonthName VARCHAR(10) NOT NULL,
    DATE_MonthNameShort CHAR(10) NOT NULL,
    DATE_Quarter INT NOT NULL,
    DATE_Year INT NOT NULL,
    DATE_FirstDayOfMonth DATE NOT NULL,
    DATE_LastDayOfMonth DATE NOT NULL,
    DATE_YYYYMM CHAR(10) NOT NULL,
    DATE_WeekendIndr CHAR(15) NOT NULL
);
GO

CREATE TABLE Time (
    TIME_ID INT NOT NULL PRIMARY KEY,
    TIME_Hour INT,
    TIME_Minute INT,
    TIME_HourMinute VARCHAR(10)
);
GO

CREATE TABLE Inventory (
    INVENTORY_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    INVENTORY_PRODUCT_ID INT,
    INVENTORY_LOCATION_ID INT,
    INVENTORY_Shelf VARCHAR(5),
    INVENTORY_Bin INT,
    INVENTORY_Quantity INT,
    INVENTORY_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE Product (
    PRODUCT_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    PRODUCT_PRODUCT_ID INT,
    PRODUCT_PRODUCT_SizeUnitMeasureCode VARCHAR(10),
    PRODUCT_PRODUCT_WeightUnitMeasureCode VARCHAR(10),
    PRODUCT_PRODUCT_SubCategoryID INT,
    PRODUCT_PRODUCTSUBCATEGORY_CategoryID INT,
    PRODUCT_PRODUCT_ModelID INT,
    PRODUCT_PRODUCTMODELILLUSTRATION_IllustrationID INT,
    PRODUCT_PRODUCTPRODUCTPHOTO_PhotoID INT,
    PRODUCT_PMPDC_DescriptionID INT,
    PRODUCT_PMPDC_CultureID VARCHAR(10),
    PRODUCT_PRODUCT_SupplierID INT,
    PRODUCT_PRODUCT_Name VARCHAR(150),
    PRODUCT_PRODUCT_Number VARCHAR(50),
    PRODUCT_PRODUCT_MakeFlag INT,
    PRODUCT_PRODUCT_FinishedGoodsFlag INT,
    PRODUCT_PRODUCT_Color VARCHAR(25),
    PRODUCT_PRODUCT_SafetyStockLevel INT,
    PRODUCT_PRODUCT_ReorderLevel INT,
    PRODUCT_PRODUCT_ReorderPoint INT,
    PRODUCT_PRODUCT_StandardCost DECIMAL(8,4),
    PRODUCT_PRODUCT_QuantityPerUnit VARCHAR(50),
    PRODUCT_PRODUCT_UnitPrice MONEY,
    PRODUCT_PRODUCT_ListPrice MONEY,
    PRODUCT_PRODUCT_UnitsOnOrder INT,
    PRODUCT_PRODUCT_Size VARCHAR(50),
    PRODUCT_PRODUCT_SizeUnitMeasureName VARCHAR(50),
    PRODUCT_PRODUCT_WeightUnitMeasureName VARCHAR(50),
    PRODUCT_PRODUCT_Weight DECIMAL(8,2),
    PRODUCT_PRODUCT_DaysToManufacture INT,
    PRODUCT_PRODUCT_ProductLine CHAR(10),
    PRODUCT_PRODUCT_Class VARCHAR(10),
    PRODUCT_PRODUCT_Style VARCHAR(10),
    PRODUCT_PRODUCTSUBCATEGORY_SubCategory VARCHAR(50),
    PRODUCT_PRODUCTCATEGORY_Category VARCHAR(50),
    PRODUCT_CATEGORY_Picture VARBINARY(MAX),
    PRODUCT_PRODUCTMODEL_Name VARCHAR(100),
    PRODUCT_PRODUCTMODEL_CatalogDescription XML, -- this is empty so idk
    PRODUCT_PRODUCTMODEL_Instructions XML,
    PRODUCT_ILLUSTRATION_Diagram XML,
    PRODUCT_CULTURE_Name VARCHAR(50),
    PRODUCT_PRODUCTDESCRIPTION_Desc NVARCHAR(MAX),
    PRODUCT_PRODUCTPRODUCTPHOTO_Primary INT,
    PRODUCT_PRODUCTPHOTO_ThumbnailPhoto VARBINARY(MAX),
    PRODUCT_PRODUCTPHOTO_ThumbnailPhotoHexString NVARCHAR(MAX),
    PRODUCT_PRODUCTPHOTO_ThumbnailPhotoFileName NVARCHAR(50),
    PRODUCT_PRODUCTPHOTO_LargePhoto VARBINARY(MAX),
    PRODUCT_PRODUCTPHOTO_LargePhotoHexString NVARCHAR(MAX),
    PRODUCT_PRODUCTPHOTO_LargePhotoFileName NVARCHAR(50),
    PRODUCT_PRODUCT_SellStartDate DATE,
    PRODUCT_DATE_SellStartDateFK INT,
    PRODUCT_PRODUCT_SellEndDate DATE,
    PRODUCT_DATE_SellEndDateFK INT,
    PRODUCT_PRODUCT_DiscountedDate DATE,
    PRODUCT_DATE_DiscountedDateFK INT,
    PRODUCT_PRODUCT_Discontinued INT,
    PRODUCT_datetime_added DATETIME DEFAULT GETUTCDATE()
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
    CUSTOMER_CUSTOMER_PersonID NVARCHAR(10),
    CUSTOMER_CUSTOMER_StoreID INT,
    CUSTOMER_CUSTOMER_TerritoryID INT,
    CUSTOMER_CUSTOMER_AccountNumber CHAR(10),
    CUSTOMER_STORE_Name NVARCHAR(50),
    CUSTOMER_STORE_SalesPersonID INT,
    CUSTOMER_STORE_Demographics XML,
    CUSTOMER_SALESTERRITORY_Name NVARCHAR(50),
    CUSTOMER_SALESTERRITORY_CountryRegionCode NVARCHAR(3),
    CUSTOMER_SALESTERRITORY_Group NVARCHAR(50),
    CUSTOMER_SALESTERRITORY_SalesYTD MONEY,
    CUSTOMER_SALESTERRITORY_SalesLastYear MONEY,
    CUSTOMER_SALESTERRITORY_CostYTD MONEY,
    CUSTOMER_SALESTERRITORY_CostLastYear MONEY,
    CUSTOMER_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE Department(
    DEPARTMENT_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    DEPARTMENT_DEPARTMENT_DeptID INT,
    DEPARTMENT_DEPARTMENT_DeptName VARCHAR(100),
    DEPARTMENT_DEPARTMENT_GroupName VARCHAR(100),
    DEPARTMENT_DEPARTMENT_DeptHeadID INT,
    DEPARTMENT_source_database VARCHAR(100),
    DEPARTMENT_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE Person(
    PERSON_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    PERSON_PERSON_BusinessEntityID INT NOT NULL,
    PERSON_PERSON_PersonType CHAR(2),
    PERSON_PERSON_NameStyle INT,
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

CREATE TABLE BillOfMaterial(
    BILLOFMATERIAL_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    BILLOFMATERIAL_BILLOFMATERIAL_BillOfMaterialID INT,
    BILLOFMATERIAL_BILLOFMATERIAL_ProductAssemblyID INT,
    BILLOFMATERIAL_BILLOFMATERIAL_ComponentID INT,
    BILLOFMATERIAL_BILLOFMATERIAL_StartDate DATE,
    BILLOFMATERIAL_BILLOFMATERIAL_EndDate DATE,
    BILLOFMATERIAL_BILLOFMATERIAL_UnitMeasureCode CHAR(3),
    BILLOFMATERIAL_BILLOFMATERIAL_BOMLevel INT,
    BILLOFMATERIAL_BILLOFMATERIAL_PerAssemblyQty DECIMAL(8,2),
    BILLOFMATERIAL_UNITMEASURE_Name NVARCHAR(50),
    BILLOFMATERIAL_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE Document(
    DOCUMENT_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    DOCUMENT_DOCUMENT_DocumentNode NVARCHAR(MAX),
    DOCUMENT_DOCUMENT_DocumentLevel INT,
    DOCUMENT_DOCUMENT_Title NVARCHAR(50),
    DOCUMENT_DOCUMENT_Owner INT,
    DOCUMENT_DOCUMENT_FolderFlag BIT,
    DOCUMENT_DOCUMENT_FileName NVARCHAR(400),
    DOCUMENT_DOCUMENT_FileExtension NVARCHAR(8),
    DOCUMENT_DOCUMENT_Revision CHAR(5),
    DOCUMENT_DOCUMENT_ChangeNumber INT,
    DOCUMENT_DOCUMENT_Status INT,
    DOCUMENT_DOCUMENT_DocumentSummary NVARCHAR(MAX),
    DOCUMENT_DOCUMENT_Document VARBINARY(MAX),
    DOCUMENT_PRODUCTDOCUMENT_ProductID INT,
    DOCUMENT_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE WorkOrder(
    WORKORDER_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    WORKORDER_WORKORDER_WorkOrderID INT,
    WORKORDER_WORKORDER_ProductID INT,
    WORKORDER_WORKORDER_OrderQty INT,
    WORKORDER_WORKORDER_StockedQty INT,
    WORKORDER_WORKORDER_ScrappedQty INT,
    WORKORDER_WORKORDER_StartDate DATE,
    WORKORDER_WORKORDER_EndDate DATE,
    WORKORDER_WORKORDER_DueDate DATE,
    WORKORDER_WORKORDER_ScrapReasonID INT,
    WORKORDER_WORKORDERINGROUTING_ProductID INT,
    WORKORDER_WORKORDERINGROUTING_OperationSequence INT,
    WORKORDER_WORKORDERINGROUTING_LocationID INT,
    WORKORDER_WORKORDERINGROUTING_ScheduledStartDate DATE,
    WORKORDER_WORKORDERINGROUTING_ScheduledEndDate DATE,
    WORKORDER_WORKORDERINGROUTING_ActualStartDate DATE,
    WORKORDER_WORKORDERINGROUTING_ActualEndDate DATE,
    WORKORDER_WORKORDERINGROUTING_ActualResourcesHrs DECIMAL(9,4),
    WORKORDER_WORKORDERINGROUTING_PlannedCost MONEY,
    WORKORDER_WORKORDERINGROUTING_ActualCost MONEY,
    WORKORDER_SCRAPREASON_ScrapReasonID INT,
    WORKORDER_SCRAPREASON_Name NVARCHAR(50),
    WORKORDER_datetime_added DATETIME DEFAULT GETUTCDATE()
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

CREATE TABLE SalesOrderHeader(
    SALESORDERHEADER_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    SALESORDERHEADER_SALESORDERDETAIL_SalesOrderID INT,
    SALESORDERHEADER_SALESORDERDETAIL_SalesOrderDetailID INT,
    SALESORDERHEADER_SALESORDERDETAIL_CarrierTrackingNumber NVARCHAR(25),
    SALESORDERHEADER_SALESORDERDETAIL_OrderQty INT,
    SALESORDERHEADER_SALESORDERDETAIL_ProductID INT,
    SALESORDERHEADER_SALESORDERDETAIL_SpecialOfferID INT,
    SALESORDERHEADER_SALESORDERDETAIL_UnitPrice DECIMAL(8,2),
    SALESORDERHEADER_SALESORDERDETAIL_UnitPriceDiscount DECIMAL(8,2),
    SALESORDERHEADER_SALESORDERDETAIL_LineTotal NVARCHAR(MAX),
    SALESORDERHEADER_SALESORDERHEADER_RevisionNumber INT,
    SALESORDERHEADER_SALESORDERHEADER_OrderDate DATE,
    SALESORDERHEADER_SALESORDERHEADER_DueDate DATE,
    SALESORDERHEADER_SALESORDERHEADER_ShipDate DATE,
    SALESORDERHEADER_SALESORDERHEADER_Status CHAR(1),
    SALESORDERHEADER_SALESORDERHEADER_OnlineOrderFlag BIT,
    SALESORDERHEADER_SALESORDERHEADER_SalesOrderNumber VARCHAR(100),
    SALESORDERHEADER_SALESORDERHEADER_PurchaseOrderNumber VARCHAR(25),
    SALESORDERHEADER_SALESORDERHEADER_AccountNumber NVARCHAR(15),
    SALESORDERHEADER_SALESORDERHEADER_CustomerID INT,
    SALESORDERHEADER_SALESORDERHEADER_SalesPersonID INT,
    SALESORDERHEADER_SALESORDERHEADER_TerritoryID INT,
    SALESORDERHEADER_SALESORDERHEADER_BillToAddress INT,
    SALESORDERHEADER_SALESORDERHEADER_ShipToAddress INT,
    SALESORDERHEADER_SALESORDERHEADER_ShipMethodID INT,
    SALESORDERHEADER_SALESORDERHEADER_CreditCardID INT,
    SALESORDERHEADER_SALESORDERHEADER_CreditCardApprovalCode NVARCHAR(15),
    SALESORDERHEADER_SALESORDERHEADER_CurrencyRateID INT,
    SALESORDERHEADER_SALESORDERHEADER_SubTotal DECIMAL(11,2),
    SALESORDERHEADER_SALESORDERHEADER_TaxAmt DECIMAL(11,2),
    SALESORDERHEADER_SALESORDERHEADER_Freight DECIMAL(11,2),
    SALESORDERHEADER_SALESORDERHEADER_TotalDue DECIMAL(11,2),
    SALESORDERHEADER_SALESORDERHEADER_Comment NVARCHAR(128),
    SALESORDERHEADER_SALESORDERHEADERSALESREASON_SalesOrderID INT,
    SALESORDERHEADER_SALESREASON_SalesReasonID INT,
    SALESORDERHEADER_SALESREASON_Name NVARCHAR(100),
    SALESORDERHEADER_SALESREASON_ReasonType NVARCHAR(100),
    SALESORDERHEADER_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE PurchaseOrderHeader(
    PURCHASEORDERHEADER_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    PURCHASEORDERHEADER_PURCHASEORDERHEADER_PurchaseOrderID INT,
    PURCHASEORDERHEADER_PURCHASEORDERHEADER_RevisionNumber INT,
    PURCHASEORDERHEADER_PURCHASEORDERHEADER_Status INT,
    PURCHASEORDERHEADER_PURCHASEORDERHEADER_EmployeeID INT,
    PURCHASEORDERHEADER_PURCHASEORDERHEADER_VendorID INT,
    PURCHASEORDERHEADER_PURCHASEORDERHEADER_ShipMethodID INT,
    PURCHASEORDERHEADER_PURCHASEORDERHEADER_OrderDate DATE,
    PURCHASEORDERHEADER_PURCHASEORDERHEADER_ShipDate DATE,
    PURCHASEORDERHEADER_PURCHASEORDERHEADER_SubTotal MONEY,
    PURCHASEORDERHEADER_PURCHASEORDERHEADER_TaxAmt MONEY,
    PURCHASEORDERHEADER_PURCHASEORDERHEADER_Freight MONEY,
    PURCHASEORDERHEADER_PURCHASEORDERHEADER_TotalDue MONEY,
    PURCHASEORDERHEADER_PURCHASEORDERDETAIL_PurchaseOrderDetailID INT,
    PURCHASEORDERHEADER_PURCHASEORDERDETAIL_DueDate DATE,
    PURCHASEORDERHEADER_PURCHASEORDERDETAIL_OrderQty INT,
    PURCHASEORDERHEADER_PURCHASEORDERDETAIL_ProductID INT,
    PURCHASEORDERHEADER_PURCHASEORDERDETAIL_UnitPrice MONEY,
    PURCHASEORDERHEADER_PURCHASEORDERDETAIL_LineTotal NVARCHAR(MAX),
    PURCHASEORDERHEADER_PURCHASEORDERDETAIL_ReceivedQty DECIMAL(8,2),
    PURCHASEORDERHEADER_PURCHASEORDERDETAIL_RejectedQty DECIMAL(8,2),
    PURCHASEORDERHEADER_PURCHASEORDERDETAIL_StockedQty DECIMAL(8,2),
    PURCHASEORDERHEADER_SHIPMETHOD_Name NVARCHAR(50),
    PURCHASEORDERHEADER_SHIPMETHOD_ShipBase MONEY,
    PURCHASEORDERHEADER_SHIPMETHOD_ShipRate MONEY,
    PURCHASEORDERHEADER_VENDOR_AccountNumber NVARCHAR(50),
    PURCHASEORDERHEADER_VENDOR_Name NVARCHAR(50),
    PURCHASEORDERHEADER_VENDOR_CreditRating INT,
    PURCHASEORDERHEADER_VENDOR_PreferredVendorStatus BIT,
    PURCHASEORDERHEADER_VENDOR_ActiveFlag BIT,
    PURCHASEORDERHEADER_VENDOR_PurchasingWebServiceURL NVARCHAR(1024),
    PURCHASEORDERHEADER_datetime_added DATETIME DEFAULT GETUTCDATE()
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

CREATE TABLE CustomerDemographic(
    CUSTOMERDEMOGRAPHIC_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CUSTOMERDEMOGRAPHIC_CUSTOMERDEMOGRAPHICS_CustomerTypeID NVARCHAR(10),
    CUSTOMERDEMOGRAPHIC_CUSTOMERDEMOGRAPHICS_CustomerDesc NVARCHAR(100),
    CUSTOMERDEMOGRAPHIC_datetime_added DATETIME DEFAULT GETUTCDATE()
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

CREATE TABLE ShoppingCartItem(
    SHOPPINGCARTITEM_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    SHOPPINGCARTITEM_SHOPPINGCARTITEM_ShoppingCartItemID INT,
    SHOPPINGCARTITEM_SHOPPINGCARTITEM_ShoppingCartID INT,
    SHOPPINGCARTITEM_SHOPPINGCARTITEM_ProductID INT,
    SHOPPINGCARTITEM_SHOPPINGCARTITEM_Quantity INT,
    SHOPPINGCARTITEM_SHOPPINGCARTITEM_DateCreated DATE,
    SHOPPINGCARTITEM_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE SalesPersonQuotaHistory(
    SALESPERSONQUOTAHISTORY_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    SALESPERSONQUOTAHISTORY_SALESPERSONQUOTAHISTORY_BusinessEntityID INT,
    SALESPERSONQUOTAHISTORY_SALESPERSONQUOTAHISTORY_QuotaDate DATE,
    SALESPERSONQUOTAHISTORY_SALESPERSONQUOTAHISTORY_SalesQuota MONEY,
    SALESPERSONQUOTAHISTORY_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE TransactionHistory(
    TRANSACTIONHISTORY_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    TRANSACTIONHISTORY_TRANSACTIONHISTORY_TransactionID INT,
    TRANSACTIONHISTORY_TRANSACTIONHISTORY_ProductID INT,
    TRANSACTIONHISTORY_TRANSACTIONHISTORY_ReferenceOrderID INT,
    TRANSACTIONHISTORY_TRANSACTIONHISTORY_ReferenceOrderLineID INT,
    TRANSACTIONHISTORY_TRANSACTIONHISTORY_TransactionDate DATE,
    TRANSACTIONHISTORY_TRANSACTIONHISTORY_TransactionType CHAR(1),
    TRANSACTIONHISTORY_TRANSACTIONHISTORY_Quantity INT,
    TRANSACTIONHISTORY_TRANSACTIONHISTORY_ActualCost MONEY,
    TRANSACTIONHISTORY_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE ProductReview(
    PRODUCTREVIEW_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    PRODUCTREVIEW_PRODUCTREVIEW_ProductReviewID INT,
    PRODUCTREVIEW_PRODUCTREVIEW_ProductID INT,
    PRODUCTREVIEW_PRODUCTREVIEW_ReviewerName NVARCHAR(50),
    PRODUCTREVIEW_PRODUCTREVIEW_ReviewDate DATE,
    PRODUCTREVIEW_PRODUCTREVIEW_EmailAddress NVARCHAR(50),
    PRODUCTREVIEW_PRODUCTREVIEW_Rating INT,
    PRODUCTREVIEW_PRODUCTREVIEW_Comments NVARCHAR(3850),
    PRODUCTREVIEW_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

CREATE TABLE TransactionHistoryArchive(
    TRANSACTIONHISTORYARCHIVE_sk INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    TRANSACTIONHISTORYARCHIVE_TRANSACTIONHISTORYARCHIVE_TransactionID INT,
    TRANSACTIONHISTORYARCHIVE_TRANSACTIONHISTORYARCHIVE_ProductID INT,
    TRANSACTIONHISTORYARCHIVE_TRANSACTIONHISTORYARCHIVE_ReferenceOrderID INT,
    TRANSACTIONHISTORYARCHIVE_TRANSACTIONHISTORYARCHIVE_ReferenceOrderLineID INT,
    TRANSACTIONHISTORYARCHIVE_TRANSACTIONHISTORYARCHIVE_TransactionDate DATE,
    TRANSACTIONHISTORYARCHIVE_TRANSACTIONHISTORYARCHIVE_TransactionType CHAR(1),
    TRANSACTIONHISTORYARCHIVE_TRANSACTIONHISTORYARCHIVE_Quantity INT,
    TRANSACTIONHISTORYARCHIVE_TRANSACTIONHISTORYARCHIVE_ActualCost MONEY,
    TRANSACTIONHISTORYARCHIVE_datetime_added DATETIME DEFAULT GETUTCDATE()
);
GO

-- CREATE TRIGGER ConvertHexToVarbinaryProduct
-- ON Product
-- AFTER INSERT, UPDATE
-- AS
-- BEGIN
--     UPDATE Product
--     SET PRODUCT_PRODUCTPHOTO_ThumbnailPhoto = CASE
--                             WHEN inserted.PRODUCT_PRODUCTPHOTO_ThumbnailPhotoHexString IS NOT NULL
--                             THEN CONVERT(VARBINARY(MAX), inserted.PRODUCT_PRODUCTPHOTO_ThumbNailPhotoHexString, 1)
--                             ELSE Product.PRODUCT_PRODUCTPHOTO_ThumbNailPhoto
--                          END,
--         PRODUCT_PRODUCTPHOTO_LargePhoto = CASE
--                         WHEN inserted.PRODUCT_PRODUCTPHOTO_LargePhotoHexString IS NOT NULL
--                         THEN CONVERT(VARBINARY(MAX), inserted.PRODUCT_PRODUCTPHOTO_LargePhotoHexString, 1)
--                         ELSE Product.PRODUCT_PRODUCTPHOTO_LargePhoto
--                      END
--     FROM inserted
--     WHERE inserted.PRODUCT_sk = Product.PRODUCT_sk
-- END;
-- GO

CREATE TRIGGER ConvertHexToVarbinaryEmployee
ON Employee
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE Employee
    SET EMPLOYEE_EMPLOYEES_Photo = CASE
                            WHEN inserted.EMPLOYEE_EMPLOYEES_PhotoHexString IS NOT NULL
                            THEN CONVERT(VARBINARY(MAX), inserted.EMPLOYEE_EMPLOYEES_PhotoHexString, 1)
                            ELSE Employee.EMPLOYEE_EMPLOYEES_Photo
                         END
    FROM inserted
    WHERE inserted.EMPLOYEE_sk = Employee.EMPLOYEE_sk
END;
GO

CREATE TRIGGER ConvertSellStartDateSellEndDateDiscountedDateToFK
ON Product
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE p
    SET PRODUCT_DATE_SellStartDateFK = CASE
        WHEN TRY_CONVERT(DATE, i.PRODUCT_PRODUCT_SellStartDate) IS NOT NULL
        THEN CONVERT(VARCHAR(8), TRY_CONVERT(DATE, i.PRODUCT_PRODUCT_SellStartDate), 112)
        ELSE '11111111'
    END,
    PRODUCT_DATE_SellEndDateFK = CASE
        WHEN TRY_CONVERT(DATE, i.PRODUCT_PRODUCT_SellEndDate) IS NOT NULL
        THEN CONVERT(VARCHAR(8), TRY_CONVERT(DATE, i.PRODUCT_PRODUCT_SellEndDate), 112)
        ELSE '11111111'
    END,
    PRODUCT_DATE_DiscountedDateFK = CASE
        WHEN TRY_CONVERT(DATE, i.PRODUCT_PRODUCT_DiscountedDate) IS NOT NULL
        THEN CONVERT(VARCHAR(8), TRY_CONVERT(DATE, i.PRODUCT_PRODUCT_DiscountedDate), 112)
        ELSE '11111111'
    END
    FROM Product p
    INNER JOIN inserted i ON i.PRODUCT_sk = p.PRODUCT_sk;
END;
