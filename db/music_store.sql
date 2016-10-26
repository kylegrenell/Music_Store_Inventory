DROP TABLE IF EXISTS sales; 
DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS accessories;

CREATE TABLE instruments (
    id SERIAL4 PRIMARY KEY,
    type VARCHAR(255),
    brand VARCHAR(255),
    cost INT4,
    quantity INT4,
    cost_price NUMERIC(10,2)
);

CREATE TABLE accessories (
    id SERIAL4 PRIMARY KEY,
    type VARCHAR(255),
    brand VARCHAR(255),
    cost INT4,
    quantity INT4,
    cost_price NUMERIC(10,2)
);  

CREATE TABLE sales (
  id serial4 PRIMARY KEY,
  quantity INT4,
  instrument_id INT4 REFERENCES instruments(id)
);


