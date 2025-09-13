-- Create database
CREATE DATABASE IF NOT EXISTS sales_dashboard;
USE sales_dashboard;

-- Customers table
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(150),
  signup_date DATE
);

-- Orders table
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  product VARCHAR(150),
  quantity INT,
  unit_price DECIMAL(10,2),
  channel VARCHAR(50),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert sample customers
INSERT INTO customers (customer_id, first_name, last_name, email, signup_date) VALUES
(1, 'Amit', 'Kumar', 'amit@example.com', '2023-01-10'),
(2, 'Rohit', 'Sharma', 'rohit@example.com', '2023-02-05'),
(3, 'Neha', 'Singh', 'neha@example.com', '2023-03-12'),
(4, 'Pooja', 'Verma', 'pooja@example.com', '2023-04-01'),
(5, 'Deepak', 'Yadav', 'deepak@example.com', '2023-05-20');

-- Insert sample orders
INSERT INTO orders (order_id, customer_id, order_date, product, quantity, unit_price, channel) VALUES
(1001, 1, '2023-01-15', 'Product A', 2, 500.00, 'online'),
(1002, 2, '2023-02-20', 'Product B', 1, 1200.00, 'store'),
(1003, 1, '2023-03-10', 'Product C', 3, 250.00, 'online'),
(1004, 3, '2023-03-25', 'Product A', 1, 500.00, 'store'),
(1005, 4, '2023-04-15', 'Product B', 2, 1200.00, 'online'),
(1006, 5, '2023-05-25', 'Product C', 1, 250.00, 'online'),
(1007, 2, '2023-06-05', 'Product A', 1, 500.00, 'store'),
(1008, 3, '2023-06-20', 'Product C', 4, 250.00, 'online'),
(1009, 4, '2023-07-01', 'Product D', 1, 800.00, 'store'),
(1010, 1, '2023-07-10', 'Product B', 1, 1200.00, 'online');

select * from orders

