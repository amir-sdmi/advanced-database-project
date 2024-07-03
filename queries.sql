--Detail information about suppliers and the number of products that they provide.
SELECT s.supplier_id, s.name, s.address, s.website, s.telephone, COUNT(p.product_id) AS product_count
FROM Supplier s
LEFT JOIN Product p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.name, s.address, s.website, s.telephone;

--10 best-selling products with the total amount and their supplier.
SELECT p.product_id, p.name AS product_name, s.name AS supplier_name, SUM(oi.quantity) AS total_quantity_sold, SUM(oi.price * oi.quantity) AS total_amount
FROM OrderItem oi
JOIN ProductVariant pv ON oi.variant_id = pv.variant_id
JOIN Product p ON pv.product_id = p.product_id
JOIN Supplier s ON p.supplier_id = s.supplier_id
GROUP BY p.product_id, p.name, s.name
ORDER BY total_quantity_sold DESC
LIMIT 10;

--List of customers and their total purchases
SELECT c.customer_id, c.full_name, SUM(o.total_amount) AS total_purchases
FROM Customer c
JOIN "Order" o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_purchases DESC;

-- List of returned items.
SELECT r.return_id, o.order_id, p.name AS product_name, r.return_date, r.reason
FROM "Return" r
JOIN OrderItem oi ON r.order_item_id = oi.order_item_id
JOIN ProductVariant pv ON oi.variant_id = pv.variant_id
JOIN Product p ON pv.product_id = p.product_id
JOIN "Order" o ON oi.order_id = o.order_id;

-- List of products in the Category 1 category that were sold last month.
SELECT p.product_id, p.name AS product_name, SUM(oi.quantity) AS total_quantity_sold
FROM OrderItem oi
JOIN ProductVariant pv ON oi.variant_id = pv.variant_id
JOIN Product p ON pv.product_id = p.product_id
JOIN Category c ON p.category_id = c.category_id
JOIN "Order" o ON oi.order_id = o.order_id
WHERE c.name = 'Category 1' 
  AND o.order_date >= DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1 month')
  AND o.order_date < DATE_TRUNC('month', CURRENT_DATE)
GROUP BY p.product_id, p.name
ORDER BY total_quantity_sold DESC;


