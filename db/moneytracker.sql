DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE transactions;

CREATE TABLE merchants(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  logo VARCHAR(255)
);

CREATE TABLE categories(
  id SERIAL primary key,
  name VARCHAR(255) not null
);

CREATE TABLE transactions(
  id SERIAL primary key,
  category_id INT REFERENCES category(id),
  merchant_id INT REFERENCES merchant(id),
  amount INT
);
