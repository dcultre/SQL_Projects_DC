CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT);
    
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    item TEXT,
    price REAL);

INSERT INTO orders (customer_id, item, price)
    VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (1, "TARDIS", 1000000.00);



SELECT 
    c.name
    ,c.email
    ,o.item
    ,o.price
FROM 
    Customers c
LEFT OUTER JOIN Orders o
    ON o.customer_id = c.id;

SELECT 
    c.name
    ,c.email
    ,SUM(o.price) AS "Total"
FROM 
    Customers c
LEFT OUTER JOIN orders o
    ON c.id = o.customer_id
GROUP BY 
    o.customer_id
ORDER BY 
    o.price DESC;