USE sakila;

-- 1 How many films are there for each of the categories in the category table:
SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;
SELECT name AS category, count(film_id) AS number_of_films
FROM sakila.category 
JOIN sakila.film_category
USING (category_id)
GROUP BY category_id
ORDER BY number_of_films DESC;

-- 2 Display the total amount rung up by each staff member in August of 2005:
SELECT * FROM sakila.payment;
SELECT * FROM sakila.staff;
SELECT concat(s.first_name,' ',s.last_name) AS staff_name, sum(p.amount) AS total_amount
FROM sakila.payment AS p
JOIN sakila.staff AS s
ON p.staff_id = s.staff_id
WHERE payment_date like '2005-08%'
GROUP BY p.staff_id
ORDER BY total_amount DESC;

-- 3 Which actor has appeared in the most films?
SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.actor;
SELECT concat(a.first_name, ' ', a.last_name) AS actor_name, count(DISTINCT fa.film_id) AS number_of_apparitions
FROM sakila.actor AS a 
JOIN sakila.film_actor AS fa
ON a.actor_id = fa.actor_id
GROUP BY actor_name
ORDER BY count(fa.film_id) DESC
LIMIT 1;

-- 4 Most active customer (the customer that has rented the most number of films):
SELECT * FROM sakila.customer;
SELECT * FROM sakila.rental;
SELECT concat(c.first_name, ' ', c.last_name) AS customer_name, count(r.rental_id) AS number_of_rental
FROM sakila.customer AS c 
JOIN sakila.rental AS r
ON c.customer_id = r.customer_id
GROUP BY customer_name
ORDER BY count(r.rental_id) DESC
LIMIT 1;

-- 5 Display the first and last names, as well as the address, of each staff member
SELECT * FROM sakila.staff;
SELECT * FROM sakila.address;
SELECT first_name, last_name, address
FROM sakila.staff
JOIN sakila.address
USING (address_id);

-- 6 List each film and the number of actors who are listed for that film:
SELECT * FROM sakila.film;
SELECT * FROM sakila.film_actor;
SELECT f.title, count(fa.actor_id) AS number_of_actors
FROM sakila.film AS f
JOIN sakila.film_actor AS fa
ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY count(fa.actor_id) DESC;

-- 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
SELECT * FROM sakila.customer;
SELECT * FROM sakila.payment;
SELECT concat(c.last_name,' ',c.first_name) AS customer_name, sum(p.amount) AS total_paid
FROM sakila.customer AS c
JOIN sakila.payment AS p
ON c.customer_id = p.customer_id
GROUP BY customer_name
ORDER BY customer_name ASC;

-- 8 List the titles of films per category:
SELECT * FROM sakila.film;
SELECT * FROM sakila.film_category;
SELECT * FROM sakila.category;
SELECT f.title, c.name AS film_category
FROM sakila.film AS f
JOIN sakila.film_category AS fc ON f.film_id = fc.film_id
JOIN sakila.category AS c ON fc.category_id = c.category_id
ORDER BY f.title ASC;
