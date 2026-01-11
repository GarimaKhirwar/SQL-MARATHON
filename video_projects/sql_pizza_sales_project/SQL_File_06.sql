-- Join the necessary tables to find the total quantity of each pizza category ordered

SELECT pt.category, SUM(od.quantity) AS quantity
FROM pizza_types pt JOIN pizzas p
ON p.pizza_type_id = pt.pizza_type_id
JOIN order_details od
ON p.pizza_id = od.pizza_id
GROUP BY pt.category
ORDER BY quantity desc;

-- logic: category is in pizza_types, quantity is in order_details, for joining these two need pizzas, JOIN GROUP BY SUM() ORDER BY()
