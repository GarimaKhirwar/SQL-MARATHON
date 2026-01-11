-- Calculate the percentage contribution of each pizza type to total revenue.

select date, 
sum(revenue) over(order by date)
as cum_revenue
from
(select o.order_date as date, 
sum(p.price * od.quantity) as revenue
from orders o join order_details od
on o.order_id = od.order_id
join pizzas p
on p.pizza_id = od.pizza_id
group by date
order by date);

-- logic: calculated each day's revenue first using subquery and then cum_revenue