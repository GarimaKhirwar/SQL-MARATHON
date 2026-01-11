-- Calculate the total revenue generated from pizza sales

SELECT * from order_details;
SELECT * from pizzas;
SELECT SUM(p.price * od.quantity) AS total_revenue FROM 
pizzas p JOIN order_details od
ON p.pizza_id = od.pizza_id;

-- logic: price is in pizzas, quantity is in order_details, JOIN and SUM()
