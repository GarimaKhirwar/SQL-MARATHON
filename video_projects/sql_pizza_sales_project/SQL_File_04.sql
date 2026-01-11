-- Identify the most common pizza size ordered


SELECT p.size , COUNT(od.quantity) AS times_ordered
FROM pizzas p JOIN order_details od
ON p.pizza_id = od.pizza_id
GROUP by p.size
ORDER by times_ordered DESC limit 1;

-- logic: size is in pizzas, quantity is in order_details,JOIN GROUP BY COUNT() ORDER BY()
