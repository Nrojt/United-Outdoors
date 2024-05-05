IF NOT EXISTS (
    SELECT name
    FROM master.dbo.sysdatabases
    WHERE name = N'Aenc'
)
CREATE DATABASE Aenc
GO

USE Aenc;

CREATE TABLE "Bonus"
(
    "bonus_id" INT IDENTITY (1, 1) NOT NULL,
    "emp_id" INT NOT NULL,
    FOREIGN KEY ("emp_id") REFERENCES "Employee" ("emp_id"),
    "bonus_date" DATE NOT NULL,
    "bonus_amount" INT NOT NULL
);

CREATE TABLE "customer"
(
    "id" INT IDENTITY (1, 1) NOT NULL,
    "fname" VARCHAR(50) NOT NULL,
    "lname" VARCHAR(50) NOT NULL,
    "address" VARCHAR(50) NOT NULL,
    "city" VARCHAR(50) NOT NULL,
    "state" CHAR(2) NOT NULL,
    "zip" VARCHAR(50) NOT NULL,
    "phone" VARCHAR(50) NOT NULL,
    "company_name" VARCHAR(50) NOT NULL
)

CREATE TABLE "department"
(
    "dept_id" INT IDENTITY (1, 1) NOT NULL,
    "dept_name" VARCHAR(50) NOT NULL,
    "dept_head_id" INT NOT NULL,
    FOREIGN KEY ("dept_head_id") REFERENCES "Employee" ("emp_id")
);

CREATE TABLE "Employee"
(
    "emp_id" INT IDENTITY (1, 1) NOT NULL,
    "emp_fname" VARCHAR(50) NOT NULL,
    "emp_lname" VARCHAR(50) NOT NULL,
    "dept_id" INT NOT NULL,
    FOREIGN KEY ("dept_id") REFERENCES "department" ("dept_id"),
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
    "id" INT IDENTITY (1, 1) NOT NULL,
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
    "region_id" INT IDENTITY (1, 1) NOT NULL,
    "region_name" VARCHAR(50) NOT NULL,
);
