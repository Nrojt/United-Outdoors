IF NOT EXISTS (
    SELECT name
    FROM master.dbo.sysdatabases
    WHERE name = N'Aenc'
)
CREATE DATABASE Aenc;
GO

USE Aenc;

CREATE TABLE "Bonus"
(
    "bonus_id" INT IDENTITY (1, 1) PRIMARY KEY NOT NULL,
    "emp_id" INT NOT NULL,
    "bonus_date" DATE NOT NULL,
    "bonus_amount" INT NOT NULL,
);

CREATE TABLE "customer"
(
    "id" INT IDENTITY (1, 1) PRIMARY KEY NOT NULL,
    "fname" VARCHAR(50) NOT NULL,
    "lname" VARCHAR(50) NOT NULL,
    "address" VARCHAR(50) NOT NULL,
    "city" VARCHAR(50) NOT NULL,
    "state" CHAR(2) NOT NULL,
    "zip" VARCHAR(50) NOT NULL,
    "phone" VARCHAR(50) NOT NULL,
    "company_name" VARCHAR(50) NOT NULL
);

CREATE TABLE "department"
(
    "dept_id" INT IDENTITY (1, 1) PRIMARY KEY NOT NULL,
    "dept_name" VARCHAR(50) NOT NULL,
    "dept_head_id" INT NOT NULL,
);

CREATE TABLE "Employee"
(
    "emp_id" INT IDENTITY (1, 1) PRIMARY KEY NOT NULL,
    "manager_id" INT NOT NULL,
    "emp_fname" VARCHAR(50) NOT NULL,
    "emp_lname" VARCHAR(50) NOT NULL,
    "dept_id" INT NOT NULL,
    "street" VARCHAR(50) NOT NULL,
    "city" VARCHAR(50) NOT NULL,
    "state" CHAR(2) NOT NULL,
    "zip_code" VARCHAR(50) NOT NULL,
    "phone" VARCHAR(50) NOT NULL,
    "status" CHAR(1) NOT NULL,
    "ss_number" VARCHAR(50) NOT NULL,
    "salary" MONEY NOT NULL,
    "start_date" DATE NOT NULL,
    "termination_date" DATE,
    "birth_date" DATE,
    "bene_health_ins" CHAR(1) NOT NULL,
    "bene_life_ins" CHAR(1) NOT NULL,
    "bene_day_care" CHAR(1) NOT NULL,
    "sex" CHAR(1) NOT NULL,
);

CREATE TABLE "product"
(
    "id" INT IDENTITY (1, 1) PRIMARY KEY NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(50) NOT NULL,
    "prod_size" VARCHAR(50) NOT NULL,
    "color" VARCHAR(50) NOT NULL,
    "quantity" INT NOT NULL,
    "unit_price" INT NOT NULL,
    "picture_name" VARCHAR(50) NOT NULL,
    "Category" VARCHAR(50) NOT NULL,
);

CREATE TABLE "region"
(
    "region" VARCHAR(50) PRIMARY KEY NOT NULL
);

CREATE TABLE "sales_order"
(
    "id" INT IDENTITY (1, 1) PRIMARY KEY NOT NULL,
    "cust_id" INT NOT NULL,
    "order_date" DATE NOT NULL,
    "region" VARCHAR(50) NOT NULL,
    "sales_rep" INT NOT NULL,
);

CREATE TABLE "sales_order_item"
(
    "sales_order_item_id" INT IDENTITY (1, 1) PRIMARY KEY NOT NULL,
    "id" INT  NOT NULL,
    "line_id" INT NOT NULL,
    "prod_id" INT NOT NULL,
    "quantity" INT NOT NULL,
    "ship_date" DATE NOT NULL,
)

CREATE TABLE "state"
(
    "state_id" CHAR(2) PRIMARY KEY NOT NULL,
    "state_name" VARCHAR(50) NOT NULL,
    "state_capital" VARCHAR(50) NOT NULL,
    "country" CHAR(3) NOT NULL,
    "region" VARCHAR(50) NOT NULL,
);
GO