DROP TABLE IF EXISTS stocks; 
DROP TABLE IF EXISTS instruments;

CREATE TABLE instruments (
    id SERIAL4 PRIMARY KEY,
    type VARCHAR(255),
    brand VARCHAR(255),
    cost INT4,
    quantity INT4
);

CREATE TABLE stocks (
  id serial4 PRIMARY KEY,
  quantity INT4,
  instrument_id INT4 REFERENCES instruments(id),
  buy INT4,
  sell INT4
);


