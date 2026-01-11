-- Determine the distribution of orders by hour of the day

SELECT  EXTRACT (hour FROM order_time) AS hour, 
COUNT(order_id) AS order_count
FROM orders
GROUP BY hour
order by hour;

-- logic: extract hour from order_time, count the number of orders, Group them by hour
