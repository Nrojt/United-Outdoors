USE Aenc;

-- Adding foreign keys
ALTER TABLE "Bonus" ADD FOREIGN KEY ("emp_id") REFERENCES "Employee" ("emp_id");
ALTER TABLE "Department" ADD FOREIGN KEY ("dept_head_id") REFERENCES "Employee" ("emp_id");
ALTER TABLE "Employee" ADD FOREIGN KEY ("dept_id") REFERENCES "Department" ("dept_id");
ALTER TABLE "Employee" ADD FOREIGN KEY ("manager_id") REFERENCES "Employee" ("emp_id");
ALTER TABLE "SalesOrder" ADD FOREIGN KEY ("cust_id") REFERENCES "customer" ("id");
ALTER TABLE "SalesOrder" ADD FOREIGN KEY ("region") REFERENCES "Region" ("region_name");
ALTER TABLE "SalesOrder" ADD FOREIGN KEY ("sales_rep") REFERENCES "Employee" ("emp_id");
ALTER TABLE "SalesOrderItem" ADD FOREIGN KEY ("prod_id") REFERENCES "Product" ("id");
ALTER TABLE "State" ADD FOREIGN KEY ("region") REFERENCES "Region" ("region_name");
GO