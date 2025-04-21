USE SCHEMA raw;

CREATE TABLE customers (
    customer_id STRING PRIMARY KEY,
    first_name STRING,
    last_name STRING,
    email STRING,
    phone STRING,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE orders (
    order_id STRING PRIMARY KEY,
    customer_id STRING,
    order_date TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status STRING
);

CREATE TABLE products (
    product_id STRING PRIMARY KEY,
    name STRING,
    category STRING,
    price DECIMAL(10, 2),
    created_at TIMESTAMP
);



CREATE TABLE payments (
    payment_id STRING PRIMARY KEY,
    order_id STRING,
    payment_date TIMESTAMP,
    payment_amount DECIMAL(10, 2),
    payment_method STRING
);


select * from customers;
select * from orders;
select * from products;
select * from payments;


CREATE STAGE ecommerce_stage
  FILE_FORMAT = ecommerce_csv_format;


PUT file:///home/eng-mohammed/snowflake_datsets/customers.csv @ecommerce_stage;


PUT file:///home/eng-mohammed/snowflake_datsets/orders.csv @ecommerce_stage;

PUT file:///home/eng-mohammed/snowflake_datsets/products.csv @ecommerce_stage;

PUT file:///home/eng-mohammed/snowflake_datsets//payments.csv @ecommerce_stage;


CREATE FILE FORMAT csv_format 
    TYPE = 'CSV' 
    FIELD_OPTIONALLY_ENCLOSED_BY = '"' 
    SKIP_HEADER = 1
    FIELD_DELIMITER = ','      
    NULL_IF = ('NULL')         
    COMPRESSION = 'GZIP';      
COPY INTO raw.customers
FROM @ecommerce_stage/customers.csv.gz
FILE_FORMAT = (FORMAT_NAME = csv_format COMPRESSION = 'GZIP')
ON_ERROR = 'SKIP_FILE';
COPY INTO raw.orders
FROM @ecommerce_stage/orders.csv.gz
FILE_FORMAT = (FORMAT_NAME = csv_format COMPRESSION = 'GZIP')
ON_ERROR = 'SKIP_FILE';
COPY INTO raw.products
FROM @ecommerce_stage/products.csv.gz
FILE_FORMAT = (FORMAT_NAME = csv_format)
ON_ERROR = 'CONTINUE';
COPY INTO raw.payments
FROM @ecommerce_stage/payments.csv.gz
FILE_FORMAT = (FORMAT_NAME = csv_format COMPRESSION = 'GZIP')
ON_ERROR = 'CONTINUE';

select * from customer_order_summary