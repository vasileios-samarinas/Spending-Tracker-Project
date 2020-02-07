DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE categories;

CREATE TABLE merchants(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  logo VARCHAR(255)
);

CREATE TABLE categories(
  id SERIAL primary key,
  name VARCHAR(255) not null);

CREATE TABLE transactions(
  id SERIAL primary key,
  category_id INT4 REFERENCES categories(id) ON DELETE CASCADE,
  merchant_id INT4 REFERENCES merchants(id) ON DELETE CASCADE,
  amount INT);
