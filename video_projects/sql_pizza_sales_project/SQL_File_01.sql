-- Retrieve the total number of orders placed

SELECT count(order_id) AS total_orders from orders;

-- logic: counting number of orders taken, hence, used count(order_id)
