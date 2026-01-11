-- List the top 5 most ordered pizza types along with their quantities

SELECT pt.name, SUM(od.quantity) AS order_count
FROM pizza_types pt JOIN pizzas p
ON p.pizza_type_id = pt.pizza_type_id
JOIN order_details od
ON p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY order_count desc limit 5;

-- logic: name is in pizza_types, quantity is in order_details, for joining these two need pizzas, JOIN GROUP BY SUM() ORDER BY()
