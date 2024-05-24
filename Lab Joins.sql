-- Use sakila
-- Select * from film_category; -- --> Film_ID and Category_ID
-- Select * from category; -- --> Category_ID
-- Select * from film; -- --> Film_ID,language_ID
-- Select * from country; -- --> Country_ID
-- Select * from City; -- --> City_ID, Country_ID
-- Select * from address; -- --> Addres_ID,City_ID 
-- Select * from payment; -- --> Paymnet_ID,Customer_ID,Staff_ID,Rental_ID
-- Select * from rental; -- -- Rental_ID,Inventory_ID,Customer_ID,Staff_ID
-- Select * from store; -- --> Store_ID, Manager_Staff_ID,addres_ID
-- Select * from customer; -- --> Customer_ID,Store_ID, Address_ID
-- Select * from staff; -- --> Staff_ID, Address_ID, Store_ID
-- Select * from inventory; -- --> inventory_id, Film_ID, Store_ID

-- 1. List the number of films per category. -- > Completed
Select c.Name, Count(Film_ID)
from film_category fc
Inner join category c
on fc.category_id=c.category_ID
group by c.Name
;

-- 2. Retrieve the store ID, city, and country for each store.
Select s.Store_ID,c.City,con.Country
from Store s
inner join address a
on s.address_ID=a.address_ID
inner join City c
on c.City_ID=a.city_ID
inner join Country con
on c.country_ID=con.Country_ID;

-- 3. Calculate the total revenue generated by each store in dollars.
Select Store_ID, Sum(p.Amount) as Revenue
from payment p
inner join Customer c
on c.Customer_ID=p.Customer_ID
Group by Store_ID;


-- 4. Determine the average running time of films for each category.
Select c.name as Category,avg(f.Length)Avg_Length
from Film f
inner join
film_category fc
on f.film_id=fc.film_id
inner join category c
on c.category_id = fc.category_id
group by c.name;


-- 5.Identify the film categories with the longest average running time.

Select c.name as Category,avg(f.Length)Avg_Length
from Film f
inner join
film_category fc
on f.film_id=fc.film_id
inner join category c
on c.category_id = fc.category_id
group by c.name
order by avg(f.Length) desc
limit 1 ;

-- 6.Display the top 10 most frequently rented movies in descending order.

Select 
f.title
-- i.inventory_ID
,Count(r.inventory_ID) as Frenquenly_Rented_Movie 
from rental r
inner join inventory i 
on r.inventory_ID=i.inventory_ID
inner join film f 
on f.film_ID=i.Film_ID
Group by f.title
order by Count(r.inventory_ID) desc
limit 10;





