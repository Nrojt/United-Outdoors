USE Aenc;

-- Adding foreign keys
ALTER TABLE "Bonus" ADD FOREIGN KEY ("emp_id") REFERENCES "Employee" ("emp_id");
ALTER TABLE "department" ADD FOREIGN KEY ("dept_head_id") REFERENCES "Employee" ("emp_id");
ALTER TABLE "Employee" ADD FOREIGN KEY ("dept_id") REFERENCES "department" ("dept_id");
ALTER TABLE "Employee" ADD FOREIGN KEY ("manager_id") REFERENCES "Employee" ("emp_id");
ALTER TABLE "sales_order" ADD FOREIGN KEY ("cust_id") REFERENCES "customer" ("id");
ALTER TABLE "sales_order" ADD FOREIGN KEY ("region") REFERENCES "region" ("region_name");
ALTER TABLE "sales_order" ADD FOREIGN KEY ("sales_rep") REFERENCES "Employee" ("emp_id");
ALTER TABLE "sales_order_item" ADD FOREIGN KEY ("prod_id") REFERENCES "product" ("id");
ALTER TABLE "state" ADD FOREIGN KEY ("region") REFERENCES "region" ("region_name");
GO