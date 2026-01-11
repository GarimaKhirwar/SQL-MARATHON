-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select name, revenue from
(select category, name, revenue,
rank() over(partition by category 
order by revenue desc) 
from (select pt.category, pt.name, 
sum(p.price * od.quantity) as revenue from 
pizza_types pt join pizzas p
on pt.pizza_type_id = p.pizza_type_id
join order_details od 
on od.pizza_id = p.pizza_id
group by pt.category, pt.name) 
as all_pizzas_revenue) as
revenue_with_rank
where rank<=3;

-- logic: 1.form the table with having category, name, revenue using join
--        2.used rank() to rank them by category and used order by() for revenue and used as to name it
-- 	   3.extract the rquired informatiob by using select clause and rank<=3