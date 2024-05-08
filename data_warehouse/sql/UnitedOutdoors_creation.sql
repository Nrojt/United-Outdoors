IF NOT EXISTS (
    SELECT name
    FROM master.dbo.sysdatabases
    WHERE name = N'UnitedOutdoors'
)
CREATE DATABASE UnitedOutdoors
GO

USE UnitedOutdoors;

CREATE TABLE NorthWindCategories (
    "CategorySK" "int" PRIMARY KEY IDENTITY(1,1) NOT NULL ,
    "CategoryID" "int" NOT NULL ,
	"CategoryName" nvarchar (15) NOT NULL ,
	"Description" "ntext" NULL ,
	"Picture" "image" NULL
);

CREATE TABLE NorthWindCustomers (
    "CustomerSK" "int" PRIMARY KEY IDENTITY(1,1) NOT NULL ,
    "CustomerID" nchar (5) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"ContactName" nvarchar (30) NULL ,
	"ContactTitle" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	"Fax" nvarchar (24) NULL
);