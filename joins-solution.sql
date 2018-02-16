-- 1. Get all customers and their addresses.
SELECT customers.first_name, customers.last_name, addresses.street, addresses.city, addresses.state, addresses.zip FROM customers
JOIN addresses on customers.id=addresses.id;

-- 2. Get all orders and their line items.
SELECT * FROM line_items
JOIN orders on line_items.order_id=orders.id;

-- 3. Which warehouses have cheetos?
SELECT warehouse.warehouse FROM warehouse
JOIN warehouse_product on warehouse_product.warehouse_id=warehouse.id
JOIN products on products.id=warehouse_product.product_id
WHERE products.description='cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT warehouse.warehouse FROM warehouse
JOIN warehouse_product on warehouse_product.warehouse_id=warehouse.id
JOIN products on products.id=warehouse_product.product_id
WHERE products.description='diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT orders.total, customers.first_name, customers.last_name FROM orders
JOIN addresses on addresses.id=orders.address_id
JOIN customers on customers.id=addresses.customer_id;

-- 6. How many customers do we have?
SELECT COUNT(customers.id) FROM customers;

-- 7. How many products do we carry?
SELECT COUNT(products.id) FROM products;

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand) FROM warehouse_product
JOIN products on products.id=warehouse_product.product_id
WHERE products.description='diet pepsi';
