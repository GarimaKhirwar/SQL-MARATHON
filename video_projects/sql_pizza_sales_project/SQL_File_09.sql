-- Group the orders by date and calculate the average number of pizzas ordered per day

select round(AVG(pizza_ordered),0) AS avg_per_day 
from (select  o.order_date AS date, 
SUM(od.quantity) as pizza_ordered 
from orders o JOIN order_details od
on o.order_id = od.order_id
GROUP BY date);

-- logic: subquery -> first added total number of pizza ordered then group them by date
-- calculated avg(pizza_ordered) by using the subquery