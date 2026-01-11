-- Join relevant tables to find the category-wise distribution of pizzas

select category, count(name) from pizza_types
GROUP BY category;

-- logic: count the names of pizza in each category
