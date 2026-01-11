-- Identify the highest-priced pizza

SELECT pt.name , p.price 
FROM pizza_types pt JOIN pizzas p
ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC limit 1;

-- logic: price is in pizzas, name is in pizza_type, JOIN and ORDER BY
