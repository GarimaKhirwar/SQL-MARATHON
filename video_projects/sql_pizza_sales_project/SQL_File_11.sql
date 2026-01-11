-- Calculate the percentage contribution of each pizza type to total revenue.

select  pt.category, 
round((SUM(p.price * od.quantity)*100.0)/ 
(select SUM(p.price * od.quantity)  
FROM pizzas p join order_details od
on p.pizza_id = od.pizza_id),2) as percent_in_revenue
from pizza_types pt JOIN pizzas p
on pt.pizza_type_id = p.pizza_type_id
JOIN order_details od 
on p.pizza_id = od.pizza_id
GROUP BY pt.category
ORDER BY percent_in_revenue desc;

-- logic: calculated percentage in revenue for each category using percent formula logic