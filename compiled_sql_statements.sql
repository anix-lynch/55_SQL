SELECT “column_names” FROM “table_name” [WHERE conditions] [ORDER BY expression [ ASC | DESC ]] LIMIT row_count;

SELECT * FROM customer WHERE age >= 25 ORDER BY age DESC LIMIT 8;

SELECT * FROM customer WHERE age >= 25 ORDER BY age ASC LIMIT 10;

JOIN SELECT table1.column1, table2.column2... FROM table1 LEFT JOIN table2 ON table1.common_field = table2.common_field;

TRUNCATE TABLE Customer_20_60;

SELECT "column_name1", COUNT ("column_name2") FROM "table_name";

SELECT COUNT(*) FROM sales;

SELECT COUNT (order_line) as "Number of Products Ordered", COUNT (DISTINCT order_id) AS "Number of Orders" FROM sales WHERE customer_id = 'CG-12520';

SELECT "column_name" FROM "table_name" WHERE "column_name" LIKE {PATTERN};

SELECT * FROM customer_table WHERE first_name LIKE 'Jo%’;

SELECT * FROM customer_table WHERE first_name LIKE '%od%’;

SELECT first_name, last_name FROM customer_table WHERE first_name LIKE 'Jas_n’;

SELECT first_name, last_name FROM customer_table WHERE last_name NOT LIKE 'J%’;

SELECT * FROM customer_table WHERE last_name LIKE 'G\%';

SELECT * FROM customer WHERE age BETWEEN 20 AND 30;

SELECT * FROM customer WHERE age>= 20 AND age<= 30;

SELECT * FROM customer WHERE age NOT BETWEEN 20 and 30;

SELECT * FROM sales WHERE ship_date BETWEEN ‘2015-04-01' AND ‘2016-04-01';

CREATE TABLE “table_name”(“column 1“ "data type for column 1"  [column 1 constraint(s)], “column 2“ "data type for column 2"  [column 2 constraint(s)], ... “column n “ [table constraint(s)] );

ALTER TABLE "table_name" ADD "column_name" "Data Type";

ALTER TABLE "table_name" DROP "column_name";

ALTER TABLE "table_name" ALTER COLUMN "column_name" TYPE "New Data Type";

ALTER TABLE "table_name" RENAME COLUMN "column 1" TO "column 2";

ALTER TABLE "table_name" ALTER COLUMN “column_name” SET NOT NULL;

ALTER TABLE "table_name" ALTER COLUMN “column_name” DROP NOT NULL;

ALTER TABLE "table_name" ADD CONSTRAINT “column_name” CHECK (“column_name”>=100);

ALTER TABLE "table_name" ADD PRIMARY KEY (“column_name”);

ALTER TABLE “child_table" ADD CONSTRAINT “child_column” FOREIGN KEY (“parent column”) REFERENCES “parent table”;

SELECT region, COUNT(customer_id) AS customer_count FROM customer GROUP BY region HAVING COUNT(customer_id) > 200 ;

CREATE USER starttech WITH PASSWORD ‘academy’;

GRANT SELECT, INSERT, UPDATE, DELETE ON products TO starttech;

GRANT ALL ON products TO starttech;

GRANT SELECT ON products TO PUBLIC;

REVOKE ALL ON products FROM starttech;

DROP USER techonthenet;

ALTER USER starttech RENAME TO ST;

SELECT usename FROM pg_user;

SELECT DISTINCT usename FROM pg_stat_activity;

SELECT * FROM customer WHERE customer_name ~* '^a+[a-z\s]+$';

SELECT * FROM customer WHERE customer_name ~* '^(a|b|c|d)+[a-z\s]+$';

SELECT * FROM customer WHERE customer_name ~* '^(a|b|c|d)[a-z]{3}\s[a-z]{4}$';

SELECT * FROM users WHERE name ~* '[a-z0-9\.\-\_]+@[a-z0-9\-]+\.[a-z]{2,5}';

SELECT a.order_line, a.product_id, a.customer_id, a.sales, b.customer_name, b.age FROM sales_2015 AS a RIGHT JOIN customer_20_60 AS b ON a.customer_id = b.customer_id ORDER BY customer_id;

CREATE TABLESPACE newspace LOCATION '/mnt/sda1/postgresql/data’;

CREATE TABLE first_table (test_column int) TABLESPACE newspace;

CREATE VIEW logistics AS SELECT a.order_line, a.order_id, b.customer_name, b.city, b.state, b.country FROM sales AS a LEFT JOIN customer as b ON a.customer_id = b.customer_id ORDER BY a.order_line;

DROP VIEW logistics;

UPDATE logistics SET Country = US WHERE Country = ‘United States’;

SELECT order_id, STRING_AGG (product_id, ‘, ') FROM sales GROUP BY order_id;

INSERT INTO customer_table VALUES (1, ‘bee', ’cee’, 32, ‘bc@xyz.com’ );

INSERT INTO customer_table (cust_id, first_name, age, email_id) VALUES (2, ‘dee', 22, ‘d@xyz.com’);

COPY customer_table (cust_id, first_name, age, email_id) FROM 'C:\tmp\customers.csv' DELIMITER ',' CSV HEADER;

SELECT TO_CHAR(sales, '9999.99’) FROM sales;

SELECT TO_DATE('2014/04/25', 'YYYY/MM/DD’);

SELECT TO_NUMBER ('1210.73', '9999.99’);

SELECT region, COUNT (customer_id) AS customer_count FROM customer GROUP BY region;

SELECT product_id, SUM (quantity) AS quantity_sold FROM sales GROUP BY product_id ORDER BY quantity_sold DESC;

SELECT customer_id, MIN(sales) AS min_sales, MAX(sales) AS max_sales, AVG(sales) AS Average_sales, SUM(sales) AS Total_sales FROM sales GROUP BY customer_id ORDER BY total_sales DESC LIMIT 5;

SELECT MIN(sales) AS Min_sales_June15 FROM sales WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30';

SELECT MAX(sales) AS Max_sales_June15 FROM sales WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30';

