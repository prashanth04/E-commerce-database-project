CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE Customers (
  customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  payment_details VARCHAR(255) NOT NULL
);

CREATE TABLE Orders (
  order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  order_date DATE NOT NULL,
  order_number VARCHAR(20) NOT NULL,
  shipping_address VARCHAR(255) NOT NULL,
  payment_status VARCHAR(20) NOT NULL,
  order_total DECIMAL(10,2) NOT NULL,
  customer_id INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Products (
  product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  product_description VARCHAR(255) NOT NULL,
  product_price DECIMAL(10,2) NOT NULL,
  product_image VARCHAR(255) NOT NULL,
  product_availability INT NOT NULL
);

CREATE TABLE Categories (
  category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL
);

CREATE TABLE Products_Categories (
  product_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (product_id, category_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id),
  FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Suppliers (
  supplier_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  supplier_name VARCHAR(255) NOT NULL,
  contact_info VARCHAR(255) NOT NULL
);

CREATE TABLE Reviews (
  review_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  review_text VARCHAR(255) NOT NULL,
  rating INT NOT NULL,
  product_id INT NOT NULL,
  customer_id INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES Products(product_id),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Shopping_Cart (
  cart_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  product_id INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Transactions (
  transaction_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  transaction_type VARCHAR(20) NOT NULL,
  transaction_date DATE NOT NULL,
  transaction_amount DECIMAL(10,2) NOT NULL,
  order_id INT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Customers (name, address, phone, email, payment_details)
VALUES ('John Doe', '123 Main St', '555-1234', 'john.doe@example.com', 'Visa ****1234'),
       ('Jane Smith', '456 Elm St', '555-5678', 'jane.smith@example.com', 'Mastercard ****5678'),
       ('Alice Johnson', '789 Oak St', '555-2468', 'alice.johnson@example.com', 'Amex ****1357'),
       ('Bob Brown', '321 Maple St', '555-8642', 'bob.brown@example.com', 'Discover ****9753'),
       ('Charlie Green', '654 Pine St', '555-4826', 'charlie.green@example.com', 'Visa ****3421'),
       ('Debbie White', '987 Birch St', '555-6097', 'debbie.white@example.com', 'Mastercard ****2468'),
       ('Edward Black', '135 Walnut St', '555-7281', 'edward.black@example.com', 'Amex ****8642'),
       ('Felicity Gray', '246 Chestnut St', '555-9153', 'felicity.gray@example.com', 'Discover ****7531'),
       ('George Orange', '369 Cedar St', '555-5379', 'george.orange@example.com', 'Visa ****1598'),
       ('Hannah Pink', '482 Cherry St', '555-8640', 'hannah.pink@example.com', 'Mastercard ****4802'),
       ('Ian Purple', '605 Willow St', '555-3719', 'ian.purple@example.com', 'Amex ****2906'),
       ('Julia Red', '728 Redwood St', '555-6824', 'julia.red@example.com', 'Discover ****8264'),
       ('Kevin Blue', '842 Sequoia St', '555-5139', 'kevin.blue@example.com', 'Visa ****9517'),
       ('Laura Yellow', '956 Spruce St', '555-3941', 'laura.yellow@example.com', 'Mastercard ****8195'),
       ('Michael Teal', '179 Cypress St', '555-2760', 'michael.teal@example.com', 'Amex ****6371');


INSERT INTO Orders (order_date, order_number, shipping_address, payment_status, order_total, customer_id)
VALUES ('2023-04-01', 'ORD-001', '123 Main St', 'Paid', 100.00, 1),
       ('2023-04-05', 'ORD-002', '456 Elm St', 'Paid', 150.00, 2),
       ('2023-04-10', 'ORD-003', '789 Oak St', 'Paid', 200.00, 3),
       ('2023-04-15', 'ORD-004', '321 Maple St', 'Paid', 250.00, 4),
       ('2023-04-20', 'ORD-005', '654 Pine St', 'Paid', 300.00, 5),
       ('2023-04-25', 'ORD-006', '987 Birch St', 'Paid', 350.00, 6),
       ('2023-04-30', 'ORD-007', '135 Walnut St', 'Paid', 400.00, 7),
       ('2023-05-01', 'ORD-008', '246 Chestnut St', 'Paid', 450.00, 8),
       ('2023-05-05', 'ORD-009', '369 Cedar St', 'Paid', 500.00, 9),
       ('2023-05-10', 'ORD-010', '482 Cherry St', 'Paid', 550.00, 10),
       ('2023-05-15', 'ORD-011', '605 Willow St', 'Paid', 600.00, 11),
       ('2023-05-20', 'ORD-012', '728 Redwood St', 'Paid', 650.00, 12),
       ('2023-05-25', 'ORD-013', '842 Sequoia St', 'Paid', 700.00, 13),
       ('2023-05-30', 'ORD-014', '956 Spruce St', 'Paid', 750.00, 14),
       ('2023-06-01', 'ORD-015', '179 Cypress St', 'Paid', 800.00, 15);

INSERT INTO Products (product_name, product_description, product_price,
 product_image, product_availability)
VALUES ('Laptop A1', 'High-performance laptop', 1000.00, 'laptop_a1.jpg', 10),
       ('Laptop B2', 'Affordable laptop', 500.00, 'laptop_b2.jpg', 20),
       ('Smartphone X1', 'Premium smartphone', 900.00, 'smartphone_x1.jpg', 15),
       ('Smartphone Y2', 'Budget smartphone', 300.00, 'smartphone_y2.jpg', 30),
       ('Tablet T1', 'Powerful tablet', 700.00, 'tablet_t1.jpg', 8),
       ('Tablet T2', 'Affordable tablet', 400.00, 'tablet_t2.jpg', 25),
       ('Smartwatch S1', 'High-end smartwatch', 600.00, 'smartwatch_s1.jpg', 12),
       ('Smartwatch S2', 'Budget smartwatch', 200.00, 'smartwatch_s2.jpg', 40),
       ('Headphones H1', 'Noise-cancelling headphones', 350.00, 'headphones_h1.jpg', 18),
       ('Headphones H2', 'Wireless headphones', 150.00, 'headphones_h2.jpg', 35),
       ('Monitor M1', '4K monitor', 800.00, 'monitor_m1.jpg', 7),
       ('Monitor M2', '1080p monitor', 300.00, 'monitor_m2.jpg', 22),
       ('Keyboard K1', 'Mechanical keyboard', 120.00, 'keyboard_k1.jpg', 45),
       ('Keyboard K2', 'Wireless keyboard', 60.00, 'keyboard_k2.jpg', 60),
       ('Mouse M1', 'Gaming mouse', 80.00, 'mouse_m1.jpg', 30);


INSERT INTO Categories (category_name)
VALUES ('Laptops'),
       ('Laptops'),
       ('Smartphones'),
       ('Smartphones'),
       ('Tablets'),
       ('Tablets'),
       ('Smartwatches'),
       ('Smartwatches'),
       ('Headphones'),
       ('Headphones'),
       ('Monitors'),
       ('Monitors'),
       ('Keyboards'),
       ('Keyboards'),
       ('Mouse');


INSERT INTO Products_Categories (product_id, category_id)
VALUES (1, 1),
       (2, 1),
       (3, 2),
       (4, 2),
       (5, 3),
       (6, 3),
       (7, 4),
       (8, 4),
       (9, 5),
       (10, 5),
       (11, 6),
       (12, 6),
       (13, 7),
       (14, 7),
       (15, 8);


INSERT INTO Suppliers (supplier_name, contact_info)
VALUES ('Supplier A', 'Email: supplier_a@example.com, Phone: 555-1111'),
       ('Supplier B', 'Email: supplier_b@example.com, Phone: 555-2222'),
       ('Supplier C', 'Email: supplier_c@example.com, Phone: 555-3333'),
       ('Supplier D', 'Email: supplier_d@example.com, Phone: 555-4444'),
       ('Supplier E', 'Email: supplier_e@example.com, Phone: 555-5555'),
       ('Supplier F', 'Email: supplier_f@example.com, Phone: 555-6666'),
       ('Supplier G', 'Email: supplier_g@example.com, Phone: 555-7777'),
       ('Supplier H', 'Email: supplier_h@example.com, Phone: 555-8888'),
       ('Supplier I', 'Email: supplier_i@example.com, Phone: 555-9999'),
       ('Supplier J', 'Email: supplier_j@example.com, Phone: 555-1010'),
       ('Supplier K', 'Email: supplier_k@example.com, Phone: 555-2020'),
       ('Supplier L', 'Email: supplier_l@example.com, Phone: 555-3030'),
       ('Supplier M', 'Email: supplier_m@example.com, Phone: 555-4040'),
       ('Supplier N', 'Email: supplier_n@example.com, Phone: 555-5050'),
       ('Supplier O', 'Email: supplier_o@example.com, Phone: 555-6060');


INSERT INTO Reviews (review_text, rating, product_id, customer_id)
VALUES ('Great laptop, fast and reliable.', 5, 1, 1),
       ('Affordable laptop, perfect for everyday use.', 4, 2, 2),
       ('Amazing premium smartphone, love the display.', 5, 3, 3),
       ('Good budget smartphone, does the job well.', 4, 4, 4),
       ('Powerful tablet, perfect for multitasking.', 5, 5, 5),
       ('Affordable tablet, great for entertainment.', 4, 6, 6),
       ('High-end smartwatch, excellent features.', 5, 7, 7),
       ('Budget smartwatch, good value for money.', 4, 8, 8),
       ('Noise-cancelling headphones, excellent sound quality.', 5, 9, 9),
       ('Wireless headphones, comfortable and good sound.', 4, 10, 10),
       ('Stunning 4K monitor, perfect for creative work.', 5, 11, 11),
       ('Good 1080p monitor, great for everyday use.', 4, 12, 12),
       ('Mechanical keyboard, excellent typing experience.', 5, 13, 13),
       ('Wireless keyboard, convenient and reliable.', 4, 14, 14),
       ('Gaming mouse, responsive and accurate.', 5, 15, 15);

INSERT INTO Shopping_Cart (customer_id, product_id, price, quantity)
VALUES (1, 1, 1000.00, 1),
       (2, 2, 500.00, 1),
       (3, 3, 900.00, 1),
       (4, 4, 300.00, 1),
       (5, 5, 700.00, 1),
       (6, 6, 400.00, 1),
       (7, 7, 600.00, 1),
       (8, 8, 200.00, 1),
       (9, 9, 350.00, 1),
       (10, 10, 150.00, 1),
       (11, 11, 800.00, 1),
       (12, 12, 300.00, 1),
       (13, 13, 120.00, 1),
       (14, 14, 60.00, 1),
       (15, 15, 80.00, 1);

INSERT INTO Transactions (transaction_type, transaction_date, transaction_amount, order_id)
VALUES ('Purchase', '2023-05-01', 1000.00, 1),
       ('Purchase', '2023-05-02', 500.00, 2),
       ('Purchase', '2023-05-03', 900.00, 3),
       ('Purchase', '2023-05-04', 300.00, 4),
       ('Purchase', '2023-05-05', 700.00, 5),
       ('Purchase', '2023-05-06', 400.00, 6),
       ('Purchase', '2023-05-07', 600.00, 7),
       ('Purchase', '2023-05-08', 200.00, 8),
       ('Purchase', '2023-05-09', 350.00, 9),
       ('Purchase', '2023-05-10', 150.00, 10),
       ('Purchase', '2023-05-11', 800.00, 11),
       ('Purchase', '2023-05-12', 300.00, 12),
       ('Purchase', '2023-05-13', 120.00, 13),
       ('Purchase', '2023-05-14', 60.00, 14),
       ('Purchase', '2023-05-15', 80.00, 15);


# Query 1: Retrieve a list of all products along with their categories.

SELECT p.product_id, p.product_name, c.category_name
FROM Products p
JOIN Products_Categories pc ON p.product_id = pc.product_id
JOIN Categories c ON pc.category_id = c.category_id;

#Query 2: Show the total revenue for each order.
SELECT o.order_id, o.order_number, SUM(p.product_price * sc.quantity) 
AS total_revenue
FROM Orders o
JOIN Shopping_Cart sc ON o.customer_id = sc.customer_id
JOIN Products p ON sc.product_id = p.product_id
GROUP BY o.order_id, o.order_number;

#Query 3: Display a list of customers
# and the number of products they've ordered,
# sorted by the highest number of products first.

SELECT c.customer_id, c.name, SUM(sc.quantity) AS total_products_ordered
FROM Customers c
JOIN Shopping_Cart sc ON c.customer_id = sc.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_products_ordered DESC;

#Query 4: Find the top 5 products with the highest average rating.

SELECT p.product_id, p.product_name, AVG(r.rating) AS average_rating
FROM Products p
JOIN Reviews r ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name
ORDER BY average_rating DESC
LIMIT 5;

# Query 5: Show the total quantity of each product sold,
# sorted by the highest quantity first.

SELECT p.product_id, p.product_name, SUM(sc.quantity) AS total_quantity_sold
FROM Products p
JOIN Shopping_Cart sc ON p.product_id = sc.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC;



