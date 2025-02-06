SELECT p1.product_name,p1.category,p1.price,p1.stock_quantity
FROM products p1
INNER JOIN (
    SELECT category,MAX(price) AS max_price
    FROM products
    GROUP BY category
) p2 ON p1.category = p2.category AND p1.price = p2.max_price;
--
SELECT p1.product_name,p1.category,p1.price,p1.stock_quantity
FROM products p1
INNER JOIN (
    SELECT category,MAX(price) AS max_price
    FROM products
    GROUP BY category
) p2 ON p1.category = p2.category AND p1.price = p2.max_price
limit 2 offset 2;
--
SELECT product_name,category,price,stock_quantity
FROM products
WHERE category = 'Electronics'
ORDER BY price DESC;
--
SELECT product_name,category,price,stock_quantity
FROM products
WHERE category = 'Clothing'
ORDER BY price ASC
LIMIT 1;

