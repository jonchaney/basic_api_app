SELECT 
    users.id AS user_id, users.first_name, categories.id AS category_id, categories.name, COUNT(products.id) 
FROM 
    users
JOIN 
    orders ON users.id = orders.user_id 
JOIN 
    orders_products ON orders.id = orders_products.order_id 
JOIN 
    products ON orders_products.product_id = products.id 
JOIN 
    categories_products ON orders_products.product_id = categories_products.product_id
JOIN 
    categories ON categories_products.category_id = categories.id 
GROUP BY 
    users.id, categories.name, categories.id 
ORDER BY 
    users.id;

SELECT users.id AS user_id, users.first_name, categories.id AS category_id, categories.name, COUNT(products.id)  FROM users JOIN orders ON users.id = orders.user_id JOIN orders_products ON orders.id = orders_products.order_id JOIN products ON orders_products.product_id = products.id JOIN categories_products ON orders_products.product_id = categories_products.product_id JOIN categories ON categories_products.category_id = categories.id GROUP BY users.id, categories.name, categories.id ORDER BY users.id;