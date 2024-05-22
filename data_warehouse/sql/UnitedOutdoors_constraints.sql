USE UnitedOutdoors;

ALTER TABLE SalesOrderHeader
ADD CONSTRAINT FK_SalesOrderHeader_SpecialOffer
FOREIGN KEY (SALESORDERHEADER_SALESORDERDETAIL_SpecialOfferID)
REFERENCES SpecialOffer(SPECIALOFFER_sk);
GO

ALTER TABLE SalesOrderHeader
ADD CONSTRAINT FK_SalesOrderHeader_CreditCard
FOREIGN KEY (SALESORDERHEADER_SALESORDERHEADER_CreditCardID)
REFERENCES CreditCard(CREDITCARD_sk);
GO

ALTER TABLE BusinessEntity
ADD CONSTRAINT FK_BusinessEntity_Person
FOREIGN KEY (BUSINESSENTITY_BUSINESSENTITYCONTACT_PersonID)
REFERENCES Person(PERSON_sk);
GO

ALTER TABLE Person
ADD CONSTRAINT FK_Person_BusinessEntity
FOREIGN KEY (PERSON_PERSON_BusinessEntityID)
REFERENCES BusinessEntity(BUSINESSENTITY_sk);
GO

ALTER TABLE BusinessEntityAddress
ADD CONSTRAINT FK_BusinessEntityAddress_BusinessEntity
FOREIGN KEY (BUSINESSENTITYADDRESS_BUSINESSENTITYADDRESS_BusinessEntityID)
REFERENCES BusinessEntity(BUSINESSENTITY_sk);
GO

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Department
FOREIGN KEY (EMPLOYEE_EMPLOYEE_DepartmentID)
REFERENCES Department(DEPARTMENT_sk);
GO

ALTER TABLE JobCandidate
ADD CONSTRAINT FK_JobCandidate_BusinessEntity
FOREIGN KEY (JOBCANDIDATE_JOBCANDIDATE_BusinessEntityID)
REFERENCES BusinessEntity(BUSINESSENTITY_sk);
GO

ALTER TABLE EmployeeDepartmentHistory
ADD CONSTRAINT FK_EmployeeDepartmentHistory_Department
FOREIGN KEY (EMPLOYEEDEPARTMENTHISTORY_EMPLOYEEDEPARTMENTHISTORY_DepartmentID)
REFERENCES Department(DEPARTMENT_sk);
GO

ALTER TABLE EmployeeDepartmentHistory
ADD CONSTRAINT FK_EmployeeDepartmentHistory_Employee
FOREIGN KEY (EMPLOYEEDEPARTMENTHISTORY_EMPLOYEEDEPARTMENTHISTORY_BusinessEntityID)
REFERENCES BusinessEntity(BUSINESSENTITY_sk);
GO

ALTER TABLE EmployeeDepartmentHistory
ADD CONSTRAINT FK_EmployeeDepartmentHistory_Shift
FOREIGN KEY (EMPLOYEEDEPARTMENTHISTORY_EMPLOYEEDEPARTMENTHISTORY_ShiftID)
REFERENCES Shift(SHIFT_sk);
GO

ALTER TABLE EmployeePayHistory
ADD CONSTRAINT FK_EmployeePayHistory_Employee
FOREIGN KEY (EMPLOYEEPAYHISTORY_EMPLOYEEPAYHISTORY_BusinessEntityID)
REFERENCES BusinessEntity(BUSINESSENTITY_sk);
GO

ALTER TABLE SalesPerson
ADD CONSTRAINT FK_SalesPerson_Employee
FOREIGN KEY (SALESPERSON_SALESPERSON_BusinessEntityID)
REFERENCES BusinessEntity(BUSINESSENTITY_sk);
GO

/*
ALTER TABLE SalesPerson
ADD CONSTRAINT FK_SalesPerson_Territory
FOREIGN KEY (SALESPERSON_SALESPERSON_TerritoryID)
REFERENCES SalesTerritory(SALESTERRITORY_sk);
GO*/

/*
ALTER TABLE ProductVendor
ADD CONSTRAINT FK_ProductVendor_Product
FOREIGN KEY (PRODUCTVENDOR_PRODUCTVENDOR_ProductID)
REFERENCES Product(PRODUCT_sk);
GO*/

ALTER TABLE ProductVendor
ADD CONSTRAINT FK_ProductVendor_BusinessEntity
FOREIGN KEY (PRODUCTVENDOR_PRODUCTVENDOR_BusinessEntityID)
REFERENCES BusinessEntity(BUSINESSENTITY_sk);
GO

/*
ALTER TABLE ProductVendor
ADD CONSTRAINT FK_ProductVendor_UnitMeasureCode
FOREIGN KEY (PRODUCTVENDOR_PRODUCTVENDOR_UnitMeasureCode)
REFERENCES UnitMeasure(UNITMEASURE_sk);
GO*/

/*
ALTER TABLE CustomerCustomerDemo
ADD CONSTRAINT FK_CustomerCustomerDemo_Customer
FOREIGN KEY (CUSTOMERCUSTOMERDEMO_CUSTOMERCUSTOMERDEMO_CustomerID)
REFERENCES Customer(CUSTOMER_sk);
GO*/

/*
ALTER TABLE CustomerCustomerDemo
ADD CONSTRAINT FK_CustomerCustomerDemo_CustomerDemographic
FOREIGN KEY (CUSTOMERCUSTOMERDEMO_CUSTOMERCUSTOMERDEMO_CustomerTypeID)
REFERENCES CustomerDemographic(CUSTOMERDEMOGRAPHIC_sk);
GO*/

/*
ALTER TABLE SalesTerritoryHistory
ADD CONSTRAINT FK_SalesTerritoryHistory_Territory
FOREIGN KEY (SALESTERRITORYHISTORY_SALESTERRITORYHISTORY_TerritoryID)
REFERENCES SalesTerritory(SALESTERRITORY_sk);
GO*/

/*
ALTER TABLE ProductListPriceHistory
ADD CONSTRAINT FK_ProductListPriceHistory_Product
FOREIGN KEY (PRODUCTLISTPRICEHISTORY_PRODUCTLISTPRICEHISTORY_ProductID)
REFERENCES Product(PRODUCT_sk);
GO*/

/*
ALTER TABLE ProductListCostHistory
ADD CONSTRAINT FK_ProductListCostHistory_Product
FOREIGN KEY (PRODUCTLISTCOSTHISTORY_PRODUCTLISTCOSTHISTORY_ProductID)
REFERENCES Product(PRODUCT_sk);
GO*/
