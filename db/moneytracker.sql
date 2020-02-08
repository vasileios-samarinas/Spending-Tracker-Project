DROP TABLE transactions;
DROP TABLE categories;
DROP TABLE merchants;


CREATE TABLE categories(
  id SERIAL primary key,
  name VARCHAR(255) not null);

CREATE TABLE merchants(
    id SERIAL primary key,
    name VARCHAR(255) not null,
    logo VARCHAR(255)
  );

CREATE TABLE transactions(
  id SERIAL primary key,
  category_id INT REFERENCES categories(id) ON DELETE CASCADE,
  merchant_id INT REFERENCES merchants(id) ON DELETE CASCADE,
  amount INT);
