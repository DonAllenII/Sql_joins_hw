select * from address;

-- 1. List all customers who live in Texas (use JOINs)
--Answer: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still
select customer.first_name as first_name, customer.last_name as last_name, address.district as state
from customer
join address
on customer.address_id = address.address_id
where address.district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
--Answer: see output
select customer.first_name as first_name, customer.last_name as last_name, payment.amount as amount
from customer
join payment
on customer.customer_id = payment.customer_id
where payment.amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries)
--Answer: Mary Smith, Douglas Graf
select first_name, last_name
from customer 
where customer_id in (
	select customer_id from payment
	where amount > 175);

-- 4. List all customers that live in Nepal (use the city table)
--Answer: None
select first_name, last_name
from customer
join address
on customer.address_id = address.address_id
join city
on address.city_id = city.city_id
where city.city = 'Nepal';


--6. How many movies of each rating are there?
--Answer: 5
select  count(film_id) as movies, rating
from film
group by rating
order by movies desc;

--5. Which staff member had the most transactions?
--Answer: Jon Stephens
select count(payment.payment_id) as transactions,staff.staff_id, staff.first_name, staff.last_name
from payment
join staff
on payment.staff_id = staff.staff_id
group by staff.staff_id
order by transactions desc;


--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
--Answer: 6 customers
select customer_id, first_name, last_name from customer
where customer_id in (
	select customer_id  from payment
	where amount > 6.99);

-- 8. how many free rentals did our stores give away?
--Answer: 14,564
select count(rental_id) as free_rentals from payment
where amount <= 0;