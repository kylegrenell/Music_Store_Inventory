DROP TABLE IF EXISTS sales; 
DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS customers;

CREATE TABLE instruments (
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    brand VARCHAR(255),
    cost INT4,
    quantity INT4
);

CREATE TABLE customers (
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    funds INT4
);

CREATE TABLE sales (
    id SERIAL4 PRIMARY KEY,
    instrument_id INT4 REFERENCES instruments(id) ON DELETE CASCADE,
    customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE
);

