-- Determine the top 3 most ordered pizza types based on revenue.

select  pt.name, 
SUM(p.price * od.quantity) as revenue
from pizza_types pt JOIN pizzas p
on pt.pizza_type_id = p.pizza_type_id
JOIN order_details od 
on p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY revenue desc limit 3;

-- logic: calculated revenue by using sum() and joining relevant tables, group them by name, used order by