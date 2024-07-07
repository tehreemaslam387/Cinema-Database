create database ticketbookings
use ticketbookings


create table cinema(
cinema_id int primary key,
cinema_name varchar(100),
country varchar(100),
state varchar(100),
city varchar(100),
area varchar(100),
movie_id int foreign key references movie(id),
show_id int foreign key references shows(id),
show_timings int foreign key references showtimings(id),
movie_timings int foreign key references movietimings(id)
);

select shows.title , reservation.no_of_tickets
from shows
inner JOIN reservation ON show.show_ID = reservation.show_ID




create table branch(
branch_id int primary key,
branch_name varchar(100) not null,
branch_location varchar(500),
no_of_screens int,
area varchar(30),
helpline_number int,
c_id int foreign key references cinema(cinema_id)
);

create table hall(
id int primary key,
name varchar(32),
seats_no int,
br_id int foreign key references branch(branch_id) ON DELETE CASCADE ON UPDATE CASCADE not null,
);

create table seat(
id int primary key,
row varchar(50),
seat_number varchar(50),
hall_id int foreign key references hall(id)ON DELETE CASCADE ON UPDATE CASCADE
);  

create table screening(
id int not null primary key,
no_of_seats_gold int not null,
no_of_seats_silver int not null,
s_branch_id int foreign key references branch(branch_id),
movie_id int foreign key references movie(id),
hall_id int foreign key references hall(id),
screening_start time not null
);


create table manager(
manager_id int,
manager_name nvarchar(max),
manager_contact int,
b_id int foreign key references branch(branch_id)
); 

CREATE Table admin(
id varchar(10) primary key,
First_Name varchar(15), 
Last_Name varchar(20),
Email_ID varchar(30),
Age int,
Phone_Number varchar(10) NOT NULL
);


create table movie(
id int primary key,
title varchar(256),
Seats_Remaining_Gold int NOT NUll,
Seats_Remaining_Silver int NOT NULL,
cost_gold_seats int not null,
cost_silver_seats int not null,
screen_id int not null,
duration_min int,
c_id int foreign key references cinema(cinema_id)
);

create table moviedetails(
release_date date,
genre varchar(100),
ratings int,
actor_names nvarchar(max),
language varchar(50),
movie_id int foreign key references movie(id)ON DELETE CASCADE ON UPDATE CASCADE,
);

create table movietimings (
id int not null primary key,
movie_id int foreign key references movie(id),
starting_time datetime,
ending_time   datetime,
hall_id int foreign key references hall(id),
price int not null,
duration_min int,
c_id int foreign key references cinema(cinema_id)
);
 
 
create table shows(
id int primary key,
title varchar(256),
Seats_Remaining_Gold int NOT NULL,
Seats_Remaining_Silver int NOT NULL,
cost_gold_seats int not null,
cost_silver_seats int not null,
screen_id int not null,
duration_min varchar(max),
c_id int foreign key references cinema(cinema_id)
);



create table showdetails(
release_date date,
genre varchar(100),
ratings int,
actor_names nvarchar(max),
language varchar(50),
show_id int foreign key references shows(id)ON DELETE CASCADE ON UPDATE CASCADE,
);

create table showtimings (
id int not null primary key,
shows_id int foreign key references shows(id),
starting_time time,
ending_time time,
hall_id int foreign key references hall(id),
price int not null,
c_id int foreign key references cinema(cinema_id)
);

create table discounts (
offer_id int primary key,
discount_percent decimal(2,2), 
active BIT ,
shows_id int foreign key references shows(id),
movie_id int foreign key references movie(id),
validity_date date,
conditions nvarchar(max),
applicable_on nvarchar(max)
);

create table customer(
cust_id int primary key identity,
fname varchar(100),
lname varchar(100),
gender varchar(50),
age int,
contact_add int,
cust_email nvarchar(max),
cust_password varchar(100)
);


create table reservation(
id varchar(10) primary key,
no_of_tickets int not null,
total_cost int not null, 
Card_Number varchar(19),
Name_on_card varchar(21),
show_ID int foreign key  REFERENCES shows(id) ON DELETE CASCADE ON UPDATE CASCADE,
r_admin_id varchar(10) Foreign Key REFERENCES admin (id) ON DELETE CASCADE ON UPDATE CASCADE
);


create table transactions(
trans_id int primary key,
card_number int,
trans_amount int,
e_ticket_id int foreign key references tickets(ticket_id),
res_id varchar(10) foreign key references reservation(id),
t_cust_id int foreign key references customer(cust_id),
trans_date date
);
alter table transactions add trans_amount int; 

create table tickets(
ticket_id int primary key,
ticket_number int,
accom_time time,
ticket_type varchar(100),
price_per_ticket int,
seat_number int foreign key references seat(id),
t_cust_id int foreign key references customer(cust_id),
total_amount int,\
alter table tickets alter column total_amount char 
month int
);
insert into 
select count (ticket_number) from tickets

                         update tickets 
                  set total_amount = ticket_number*price_per_ticket


create table reports(
report_id int,
report_date date,
income money
);

-----------------------------------------------------------------------------------------------------------
--------------------------------employee data database-----------------------------------------------------


create database employee_data
use employee_data 

create table employee_info(
e_id int primary key,
e_name varchar(50) not null,
e_father_name varchar(50) not null,
e_DOB date not null,
e_contact_no integer ,
e_join_date date not null,
e_mail_address varchar(60) ,
e_address varchar(100) not null,
employee_job varchar(50)
);

create table employee_salary(
sal_id integer primary key,
sal_date date not null,
sal_amount decimal(8,4) not null,
sal_status varchar(15) not null,
s_eployee_id int foreign key references employee_info(e_id)
);

create table reports(
report_id int,
report_date date,
expense money
);

-----------------------------------------------------------------------------------------------------------
------------------------------------ cafeteria database ------------------------------------------------------ 
create database cafeteria
use cafeteria

CREATE TABLE food_list (
f_id int primary key,
  food_name varchar(255) NOT NULL,
  price int NOT NULL,
  foodcategory varchar(255) NOT NULL,
);

CREATE TABLE ordereditems (
order_id int primary key,
  quantity int NOT NULL,
  order_date date NOT NULL,
totalprice int NOT NULL,
o_order_id int foreign key references food_list(f_id),
customer_name varchar(50)
);

create table payment(
payment_id int primary key,
quantity int,
payment_type varchar(50),
payment_amount int,
o_item_id int foreign key references food_list(f_id),
p_order_id int foreign key references ordereditems(order_id),
customer_name varchar(50)
);

create table reports(
report_id int,
report_date date,
income money
);

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
select * from cinema
select * from branch
select * from manager
select * from admin
select * from customer
select * from halls
select * from seat
select * from screening
select * from reservation
select * from tickets
select * from transactions
select * from movie
select * from moviedetails
select * from movietimings
select * from shows
select * from showdetails
select * from showtimings
select * from reports
select * from discounts

-----------------------------------------------------------------------------------------------------------
select * from employee_info
select * from employee_salary
select * from reports

------------------------------------------------------------------------------------------------------------
select * from food_list
select * from payment
select * from reports



-----------------------------------------------------------------------------------------------------------
---------------------------------inner joins (ticketookings)----------------------------------------------------------------------
                    

 --cinemas along with the movies being shown--
SELECT cinema.*, movie.title
FROM cinema
 JOIN movie ON cinema.cinema_id = movie.c_id;


--cinemas along with the shows being shown--          

SELECT cinema.*, shows.title
FROM cinema
INNER JOIN shows ON cinema.cinema_id = shows.c_id;

--  cinemas and their corresponding show timings--

SELECT cinema.*, showtimings.starting_time, showtimings.ending_time
FROM cinema
INNER JOIN showtimings ON cinema.cinema_id = showtimings.c_id;


--  cinemas and their corresponding movie timings--

SELECT cinema.*, movietimings.starting_time, movietimings.ending_time
FROM cinema
INNER JOIN movietimings ON cinema.cinema_id = movietimings.c_id;

--branches with corresponding cinemas--
SELECT branch.*, cinema.cinema_name
FROM branch
INNER JOIN cinema ON branch.c_id = cinema.cinema_id;

--halls with corresponding branches--
SELECT hall.*, branch.branch_name
FROM hall
INNER JOIN branch ON hall.br_id = branch.branch_id;
  
--seats with corresponding halls--
SELECT seat.*, hall.name
FROM seat
INNER JOIN hall ON seat.hall_id = hall.id;


--screens with corresponding movies and branch--             
SELECT screening.*, branch.branch_name, movie.title
FROM screening
INNER JOIN branch ON screening.s_branch_id = branch.branch_id
INNER JOIN movie ON screening.movie_id = movie.id;
  
--branch with corresponding manager name--
SELECT manager.*, branch.branch_name
FROM manager
INNER JOIN branch ON manager.b_id = branch.branch_id;

--movie with corresponding moviedetails--   
SELECT moviedetails.*, movie.title
FROM moviedetails
INNER JOIN movie ON moviedetails.movie_id = movie.id;

--movie and corresponding hall details--
SELECT movietimings.*, movie.title, hall.name
FROM movietimings
INNER JOIN movie ON movietimings.movie_id = movie.id
INNER JOIN hall ON movietimings.hall_id = hall.id;

--movie timings with corresponding movie and hall information--
SELECT movietimings.*, movie.title, hall.name
FROM movietimings
INNER JOIN movie ON movietimings.movie_id = movie.id
INNER JOIN hall ON movietimings.hall_id = hall.id; 


-- overlapping movie timings in the same hall--
SELECT mt1.*, mt2.*
FROM movietimings mt1
INNER JOIN movietimings mt2 ON mt1.hall_id = mt2.hall_id
WHERE mt1.id <> mt2.id
  AND mt1.starting_time < mt2.ending_time
  AND mt1.ending_time > mt2.starting_time;


--shows with corresponding show details--
SELECT showdetails.*, shows.title
FROM showdetails
INNER JOIN shows ON showdetails.show_id = shows.id;


--show timings with corresponding show and hall information--
SELECT showtimings.*, shows.title, hall.name
FROM showtimings
INNER JOIN shows ON showtimings.shows_id = shows.id
INNER JOIN hall ON showtimings.hall_id = hall.id;

                    
-- overlapping show timings in the same hall--
SELECT st1.*, st2.*
FROM showtimings st1
INNER JOIN showtimings st2 ON st1.hall_id = st2.hall_id
WHERE st1.id <> st2.id
  AND st1.starting_time < st2.ending_time
  AND st1.ending_time > st2.starting_time;


-- discounts with corresponding show and movie information--

SELECT discounts.*, shows.title, movie.title
FROM discounts
INNER JOIN shows ON discounts.shows_id = shows.id
INNER JOIN movie ON discounts.movie_id = movie.id;


--discounts for a specific show and movie combination:--
SELECT discounts.*, shows.title, movie.title
FROM discounts
INNER JOIN shows ON discounts.shows_id = shows.id
INNER JOIN movie ON discounts.movie_id = movie.id
WHERE shows.id = 6 AND movie.id = 7;

--reservation and the admin details--
 SELECT reservation.*, shows.title, admin.First_Name, admin.Last_Name
FROM reservation
INNER JOIN shows ON reservation.show_ID = shows.id
INNER JOIN admin ON reservation.r_admin_id = admin.id;


--transaction details with ticket details--
SELECT transactions.*, tickets.ticket_number, reservation.id, customer.fname, customer.lname
FROM transactions
INNER JOIN tickets ON transactions.e_ticket_id = tickets.ticket_id
INNER JOIN reservation ON transactions.res_id = reservation.id
INNER JOIN customer ON transactions.t_cust_id = customer.cust_id;

--ticket details with customer details--
SELECT tickets.*, seat.seat_number, customer.fname, customer.lname
FROM tickets
INNER JOIN seat ON tickets.seat_number = seat.id
INNER JOIN customer ON tickets.t_cust_id = customer.cust_id;

 --Retrieve tickets with related tickets of the same customer--
SELECT t1.*, t2.ticket_number AS related_ticket_number
FROM tickets t1
INNER JOIN tickets t2 ON t1.t_cust_id = t2.t_cust_id
WHERE t1.ticket_id <> t2.ticket_id;
 
-----------------------------------------------------------------------------------------------------------
---------------------------------------left joins---------------------------------------------------------------
 -- show timings with corresponding show information--
SELECT showtimings.*, shows.title
FROM showtimings
LEFT JOIN shows ON showtimings.shows_id = shows.id;

SELECT *
FROM cinema
LEFT JOIN branch ON cinema.cinema_id = branch.c_id
LEFT JOIN hall ON branch.branch_id = hall.br_id
LEFT JOIN seat ON hall.id = seat.hall_id
LEFT JOIN screening ON hall.id = screening.hall_id
LEFT JOIN manager ON branch.branch_id = manager.b_id
LEFT JOIN admin ON cinema.cinema_id = admin.id
LEFT JOIN movie ON cinema.cinema_id= movie.c_id
LEFT JOIN moviedetails ON movie.id = moviedetails.movie_id
LEFT JOIN movietimings ON hall.id = movietimings.hall_id
LEFT JOIN shows ON cinema.show_id = shows.id
LEFT JOIN showdetails ON shows.id = showdetails.show_id
LEFT JOIN showtimings ON hall.id = showtimings.hall_id
LEFT JOIN discounts ON shows.id = discounts.shows_id
LEFT JOIN reservation ON shows.id = reservation.show_ID
LEFT JOIN transactions ON reservation.id = transactions.res_id
LEFT JOIN tickets ON seat.id = tickets.seat_number
LEFT JOIN reports ON cinema.cinema_id = reports.report_id;

-----------------------------------------------------------------------------------------------------------
-------------------------------------right joins-----------------------------------------------------------

--Right Join between cinema and movie tables--

SELECT *
FROM cinema
right JOIN movie ON movie.c_id = cinema.cinema_id;

--Right Join between branch and cinema tables--

SELECT *
FROM branch
RIGHT JOIN cinema ON branch.c_id = cinema.cinema_id;

--Right Join between hall and branch tables--

SELECT *
FROM hall
RIGHT JOIN branch ON hall.br_id = branch.branch_id;

--Right Join between seat and hall tables--

SELECT *
FROM seat
RIGHT JOIN hall ON seat.hall_id = hall.id;

--Right Join between screening and branch tables--
SELECT *
FROM screening
RIGHT JOIN branch ON screening.s_branch_id = branch.branch_id;

--Right Join between manager and branch tables--
SELECT *
FROM manager
RIGHT JOIN branch ON manager.b_id = branch.branch_id;

--Right Join between admin and branch tables--
SELECT *
FROM admin
RIGHT JOIN branch ON admin.id = branch.c_id;

--Right Join between moviedetails and movie tables--
SELECT *
FROM moviedetails
RIGHT JOIN movie ON moviedetails.movie_id = movie.id;

--Right Join between movietimings and hall tables--
SELECT *
FROM movietimings
RIGHT JOIN hall ON movietimings.hall_id = hall.id;

--Right Join between showdetails and shows tables--
SELECT *
FROM showdetails
RIGHT JOIN shows ON showdetails.show_id = shows.id;

--Right Join between showtimings and hall tables--
SELECT *
FROM showtimings
RIGHT JOIN hall ON showtimings.hall_id = hall.id;

--Right Join between discounts and shows tables--
SELECT *
FROM discounts
RIGHT JOIN shows ON discounts.shows_id = shows.id;

--Right Join between customer and tickets tables--
SELECT *
FROM customer
RIGHT JOIN tickets ON customer.cust_id = tickets.t_cust_id;

--Right Join between reservation and shows tables--
SELECT *
FROM reservation
RIGHT JOIN shows ON reservation.show_ID = shows.id;

--Right Join between transactions and tickets tables--
SELECT *
FROM transactions
RIGHT JOIN tickets ON transactions.e_ticket_id = tickets.ticket_id;





---------------------------------joins (employee data)----------------------------------------------------- 
--------------------------------------inner_joins----------------------------------------------------------
--employee info with employee salary details--

SELECT *
FROM employee_info
INNER JOIN employee_salary ON employee_info.e_id = employee_salary.s_eployee_id

------------------------------------------left join--------------------------------------------------------
SELECT *
FROM employee_info
LEFT JOIN employee_salary ON employee_info.e_id = employee_salary.s_eployee_id;


------------------------------------------right join-------------------------------------------------------
SELECT *
FROM employee_info
RIGHT JOIN employee_salary ON employee_info.e_id = employee_salary.s_eployee_id;


---------------------------------joins(cafeteria)----------------------------------------------------------
----------------------------------inner_joins--------------------------------------------------------------
--customer along with order details--
  SELECT f.food_name, f.price, o.quantity, o.order_date, o.totalprice, p.payment_type, p.payment_amount
FROM food_list f
INNER JOIN ordereditems o ON f.f_id = o.o_order_id
INNER JOIN payment p ON o.order_id = p.p_order_id;
        
-------------------------------------left join-------------------------------------------------------------
SELECT *
FROM food_list
LEFT JOIN ordereditems ON food_list.f_id = ordereditems.o_order_id
LEFT JOIN payment ON ordereditems.order_id = payment.p_order_id;


-------------------------------------right join------------------------------------------------------------
SELECT *
FROM food_list
RIGHT JOIN ordereditems ON food_list.f_id = ordereditems.o_order_id
RIGHT JOIN payment ON ordereditems.order_id = payment.p_order_id;

-----------------------------------------------------------------------------------------------------------
--------------------------------update+aggregate_functions----------------------------------------------------

-- calculating monthly income of cinema by saling tickets--
select*from reports
UPDATE reports
SET income = (
  SELECT SUM(total_amount)
  FROM tickets
  WHERE report_date = '2023-01-01'
  );

--calculating total salaries paid to emplyees as expense of cinema--
select*from reports
UPDATE reports
SET expense = (
  SELECT SUM(sal_amount)
  FROM employee_salary
  WHERE report_date = '2023-01-01'
  );
--calculating total income of cafeteria--
select*from reports
UPDATE reports
SET income = (
  SELECT SUM(payment_amount)
  FROM payment
  WHERE report_date = '2023-01-01'
  );
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

------------------------- ticketbookings (aggregate functions)---------------------------------------------

SELECT COUNT(*) FROM cinema;
SELECT COUNT(*) FROM branch;
SELECT no_of_screens = SUM(no_of_screens) FROM branch WHERE c_id = 1;
SELECT ratings = AVG(ratings) FROM moviedetails; 
SELECT MAX(Seats_Remaining_Gold) FROM movie WHERE id = <movie_id>;
SELECT MIN(cost_silver_seats) FROM shows WHERE id = <show_id>;
SELECT COUNT(*) FROM reservation;
SELECT avg_trans_amount = AVG(trans_amount) FROM transactions;
SELECT minimum=MIN(trans_amount) FROM transactions;
SELECT maximum=MAX(trans_amount) FROM transactions;
SELECT gender,no_of_customers=COUNT(*) FROM customer GROUP BY gender;          --count male and female customers--
SELECT total=SUM(income) FROM reports;
--for calculating total amount for certain days--
SELECT SUM(trans_amount) AS total_amount                                         
FROM transactions
WHERE trans_date >= '2023-01-01' AND trans_date <= '2023-02-01';
--for calculating maximum amount of transaction--
SELECT *
FROM transactions
WHERE trans_amount = (SELECT MAX(trans_amount) FROM transactions);

-----------------------------------------------------------------------------------------------------------
--------------------------------------aggregate functions(cafeteria)---------------------------------------
--Total number of food items ordered--
SELECT COUNT(*) AS total_items_ordered
FROM ordereditems;

--Total sum of prices for all food items--
SELECT SUM(price) AS total_price
FROM food_list;

--Maximum price among all food items--
SELECT MAX(price) AS max_price
FROM food_list;

--Minimum price among all food items--
SELECT MIN(price) AS min_price
FROM food_list;

--Average price of food items--
SELECT AVG(price) AS average_price
FROM food_list;

--Total revenue from food orders--
SELECT SUM(totalprice) AS total_revenue
FROM ordereditems;

--Number of distinct food categories--
SELECT COUNT(DISTINCT foodcategory) AS distinct_categories
FROM food_list;


-----------------------------------------------------------------------------------------------------------
-----------------------------------aggregate functions(employee_data)---------------------------------------

--Count the total number of employees--

SELECT COUNT(*) AS total_employees
FROM employee_info;

--Calculate the sum of salary amount--

SELECT SUM(sal_amount) AS total_salary_amount
FROM employee_salary;

--Get the maximum salary amount--

SELECT MAX(sal_amount) AS max_salary_amount
FROM employee_salary;

--Get the minimum salary amount--

SELECT MIN(sal_amount) AS min_salary_amount
FROM employee_salary;

--Calculate the average salary amount--

SELECT AVG(sal_amount) AS average_salary_amount
FROM employee_salary;

--Calculate the total expense in the reports table--

SELECT SUM(expense) AS total_expense
FROM reports;

--Count the number of distinct report dates--
SELECT COUNT(DISTINCT report_date) AS distinct_report_dates
FROM reports;

-----------------------------------------------------------------------------------------------------------
--------------------------------------group by queries(ticketbookings)---------------------------------------------------------
--average_ratings--
SELECT genre, AVG(ratings) as avg_ratings
FROM moviedetails
GROUP BY genre;

--seats remaining--
SELECT title, SUM(Seats_Remaining_Gold) as total_seats_remaining_gold
FROM shows
GROUP BY title;
SELECT title, SUM(Seats_Remaining_silver) as total_seats_remaining_silver
FROM shows
GROUP BY title;

-- branch count in different cities--
SELECT country, city, COUNT(*) as branch_count
FROM cinema
GROUP BY country, city;

--total transactions done by particular card--
SELECT card_number, SUM(trans_amount) as total_transaction_amount
FROM transactions
GROUP BY card_number;

--average age of bith genders--      
SELECT gender, AVG(age) as average_age
FROM customer
GROUP BY gender;

--Group movies by duration range and count the number of movies in each range--
SELECT CASE 
           WHEN duration_min <= 90 THEN 'Short (< 90 min)'
           WHEN duration_min <= 120 THEN 'Medium (90-120 min)'
           ELSE 'Long (> 120 min)'
       END AS duration_range,
       COUNT(*) AS movie_count
FROM movie
GROUP BY duration_min;

-- total amount of tickets sold for each month--
SELECT month, SUM(ticket_number) AS total_tickets_sold
FROM tickets
GROUP BY month;

--calculate the total cost for each show earned--
SELECT show_ID, SUM(total_cost) AS total_cost
FROM reservation
GROUP BY show_ID;

-----------------------------------------------------------------------------------------------------------
--------------------------------------group by queries(employee_data)--------------------------------------

--Group employees by their job title and count the number of employees in each job title--

SELECT employee_job, COUNT(*) AS employee_count
FROM employee_info
GROUP BY employee_job;

--Group employee salaries by their status and calculate the average salary for each status--

SELECT sal_status, AVG(sal_amount) AS average_salary
FROM employee_salary
GROUP BY sal_status;

--Group reports by the report date and calculate the total expense for each date--

SELECT report_date, SUM(expense) AS total_expense
FROM reports
GROUP BY report_date;

--Group employees by their join year and calculate the total count of employees joining in each year--

SELECT YEAR(e_join_date) AS join_year, COUNT(*) AS employee_count
FROM employee_info
GROUP BY YEAR(e_join_date);

--Group employee salaries by their job title and calculate the maximum salary for each job title--

SELECT employee_job, MAX(sal_amount) AS max_salary
FROM employee_salary
GROUP BY employee_job;

-----------------------------------------------------------------------------------------------------------
-------------------------------group by queries(cafeteria)-------------------------------------------------

--Group by food category and calculate the total price for each category in the food_list table--

SELECT foodcategory, SUM(price) AS total_price
FROM food_list
GROUP BY foodcategory;

--Group by order date and calculate the total quantity of items ordered on each date in the ordereditems table--

SELECT order_date, SUM(quantity) AS total_quantity
FROM ordereditems
GROUP BY order_date;

--Group by payment type and calculate the total payment amount for each payment type in the payment table--

SELECT payment_type, SUM(payment_amount) AS total_payment_amount
FROM payment
GROUP BY payment_type;

--Group by report date and calculate the total income for each report date in the reports table--

SELECT report_date, SUM(income) AS total_income
FROM reports
GROUP BY report_date;

-----------------------------------------------------------------------------------------------------------
---------------------------------------order by queries(ticketbookings)--------------------------------------------------------
SELECT * FROM movie ORDER BY title ASC;
SELECT * FROM moviedetails ORDER BY ratings DESC;
SELECT * FROM movie ORDER BY duration_min ASC;
SELECT * FROM shows ORDER BY screen_id ASC;
SELECT * FROM reservation ORDER BY total_cost DESC;
SELECT * FROM customer ORDER BY fname ASC;
SELECT * FROM seat ORDER BY seat_number ASC;
SELECT * FROM branch ORDER BY branch_name ASC;
SELECT * FROM manager ORDER BY manager_name ASC;
SELECT * FROM screening ORDER BY screening_start ASC;
SELECT * FROM showdetails ORDER BY release_date ASC;
SELECT * FROM discounts ORDER BY offer_id ASC;

-----------------------------------------------------------------------------------------------------------
----------------------------------order by queries(cafeteria)------------------------------------------

SELECT * FROM food_list ORDER BY food_name ASC;
SELECT * FROM ordereditems ORDER BY order_date DESC;
SELECT * FROM payment ORDER BY payment_amount ASC, quantity DESC;

-----------------------------------------------------------------------------------------------------------
----------------------------------order by queries(employee_data)------------------------------------------

SELECT employee_job, COUNT(*) as total_employees FROM employee_info GROUP BY employee_job;
SELECT sal_status, AVG(sal_amount) as avg_salary FROM employee_salary GROUP BY sal_status;
SELECT report_date, SUM(expense) as total_expense FROM reports GROUP BY report_date;

-----------------------------------------------------------------------------------------------------------
----------------------------------------aliases(ticketbookings)-----------------------------------------------------------
--cinema--
SELECT c.cinema_id, c.cinema_name, c.country, c.state, c.city, c.area 
FROM cinema AS c;
--branch--
SELECT b.branch_id, b.branch_name, b.branch_location, b.no_of_screens, b.area, b.helpline_number 
FROM branch AS b;    
--hall--
SELECT h.id, h.name, h.seats_no, h.br_id 
FROM hall AS h;
--seat--
SELECT s.id, s.row, s.seat_number, s.hall_id 
FROM seat AS s;
--screening--
SELECT sc.id, sc.no_of_seats_gold, sc.no_of_seats_silver, sc.s_branch_id, sc.movie_id, sc.hall_id, sc.screening_start 
FROM screening AS sc;
--manager--
SELECT m.manager_id, m.manager_name, m.manager_contact, m.b_id 
FROM manager AS m;
--admin--
SELECT a.id, a.First_Name, a.Last_Name, a.Email_ID, a.Age, a.Phone_Number 
FROM admin AS a;
--movie--
SELECT m.id, m.title, m.Seats_Remaining_Gold, m.Seats_Remaining_Silver, m.cost_gold_seats, m.cost_silver_seats, m.screen_id, m.duration_min 
FROM movie AS m;
--moviedetails--
SELECT md.release_date, md.genre, md.ratings, md.actor_names, md.language, md.movie_id 
FROM moviedetails AS md;
--movietimings--
SELECT mt.id, mt.movie_id, mt.starting_time, mt.ending_time, mt.hall_id, mt.price 
FROM movietimings AS mt;

-----------------------------------------------------------------------------------------------------------
--------------------------------------aliases(employee_data)---------------------------------------------------------------------

-- Alias for employee_info table--
SELECT *
FROM employee_info AS ei;

-- Alias for employee_salary table--
SELECT *
FROM employee_salary AS es;

-- Alias for reports table--
SELECT *
FROM reports AS r;

-----------------------------------------------------------------------------------------------------------
-----------------------------------aliases(cafeteria)------------------------------------------------------
--Alias query for food_list table--

SELECT f.f_id AS food_id, f.food_name AS food, f.price AS food_price, f.foodcategory AS category
FROM food_list AS f;

--Alias query for ordereditems table--

SELECT o.order_id AS order_number, o.quantity AS item_quantity, o.order_date, o.totalprice AS total_price,
       o.o_order_id AS food_id, o.customer_name AS customer
FROM ordereditems AS o;
--Alias query for payment table--

SELECT p.payment_id AS payment_number, p.quantity AS payment_quantity, p.payment_type, p.payment_amount,
       p.o_item_id AS food_id, p.p_order_id AS order_id, p.customer_name AS customer
FROM payment AS p;

--Alias query for reports table--

SELECT r.report_id AS report_number, r.report_date, r.income AS report_income
FROM reports AS r;


-----------------------------------------------------------------------------------------------------------
---------------------------------ticketbooking database insertions------------------------------------------  --

select*from cinema
insert into cinema values
(1,'Sozo','Pakistan','Punjab','Lahore','Fortress',1,1,1,1),
(2,'Pf cinema','Pakistan','Punjab','Lahore','Cantt',2,2,2,2),
(3,'Paragon Cinema','Pakistan','Punjab','Lahore','Paragon society',3,3,3,3),
(4,'DHA cinema','Pakistan','Punjab','Lahore','DHA y-block',4,4,4,4);

select*from branch
insert into branch values
(1,'sozo2','Emporium Mall',6,'johar town',34567,1),
(2,'sozo3','Sqaure Mall',4,'Fortress',00067,1),
(3,'pF cinema','pachages Mall',7,'wapda town',39867,2),
(4,'pf cinema','cantt',2,'cantt',56567,2),
(5,'paragon cinema','paragon society 2',4,'paragon society 2',09867,3),
(6,'DHA cinema','DHA pahse 6',6,'phase 6',67567,4);

select*from hall
insert into hall values(1,'alhamra hall',250,2)
insert into hall values(2,'Alama hall',550,2)
insert into hall values(3,'Iqbal hall',850,4)
insert into hall values(4,'gold hall',450,6)
insert into hall values(5,'silver hall',250,3)
insert into hall values(6,'new hall',1000,1)
insert into hall values(7,'Qauid hall',800,5)
insert into hall values(8,'Jinnah hall',350,3)

select*from seat
insert into seat(row,seat_number,hall_id) values
('A','1A',1),('A','2A',1),('A','3A',1),('A','4A',1),('A','5A',1),('A','6A',1),('A','7A',1),('A','8A',1),('A','9A',1),('A','10A',1),
('B','1B',1),('B','2B',1),('B','3B',1),('B','4B',1),('B','5B',1),('B','6B',1),('B','7B',1),('B','8B',1),('B','9B',1),('B','10B',1),
('C','1C',1),('C','2C',1),('C','3C',1),('C','4C',1),('C','5C',1),('C','6C',1),('C','7C',1),('C','8C',1),('C','9C',1),('C','10C',1),
('D','1D',1),('D','2D',1),('D','3D',1),('D','4D',1),('D','5D',1),('D','6D',1),('D','7D',1),('D','8D',1),('D','9D',1),('D','10D',1),
('E','1E',1),('E','2E',1),('E','3E',1),('E','4E',1),('E','5E',1),('E','6E',1),('E','7E',1),('E','8E',1),('E','9E',1),('E','10E',1),
('F','1F',1),('F','2F',1),('F','3F',1),('F','4F',1),('F','5F',1),('F','6F',1),('F','7F',1),('F','8F',1),('F','9F',1),('F','10F',1),
('G','1G',1),('G','2G',1),('G','3G',1),('G','4G',1),('G','5G',1),('G','6G',1),('G','7G',1),('G','8G',1),('G','9G',1),('G','10G',1),
('H','1H',1),('H','2H',1),('H','3H',1),('H','4H',1),('H','5H',1),('H','6H',1),('H','7H',1),('H','8H',1),('H','9H',1),('H','10H',1),
('I','1I',1),('I','2I',1),('I','3I',1),('I','4I',1),('I','5I',1),('I','6I',1),('I','7I',1),('I','8I',1),('I','9I',1),('I','10I',1),
('J','1J',1),('J','2J',1),('J','3J',1),('J','4J',1),('J','5J',1),('J','6J',1),('J','7J',1),('J','8J',1),('J','9J',1),('J','10J',1);

insert into seat(row,seat_number,hall_id) values
('A','1A',2),('A','2A',2),('A','3A',2),('A','4A',2),('A','5A',2),('A','6A',2),('A','7A',2),('A','8A',2),('A','9A',2),('A','10A',2),
('B','1B',2),('B','2B',2),('B','3B',2),('B','4B',2),('B','5B',2),('B','6B',2),('B','7B',2),('B','8B',2),('B','9B',2),('B','10B',2),
('C','1C',2),('C','2C',2),('C','3C',2),('C','4C',2),('C','5C',2),('C','6C',2),('C','7C',2),('C','8C',2),('C','9C',2),('C','10C',2),
('D','1D',2),('D','2D',2),('D','3D',2),('D','4D',2),('D','5D',2),('D','6D',2),('D','7D',2),('D','8D',2),('D','9D',2),('D','10D',2),
('E','1E',2),('E','2E',2),('E','3E',2),('E','4E',2),('E','5E',2),('E','6E',2),('E','7E',2),('E','8E',2),('E','9E',2),('E','10E',2),
('F','1F',2),('F','2F',2),('F','3F',2),('F','4F',2),('F','5F',2),('F','6F',2),('F','7F',2),('F','8F',2),('F','9F',2),('F','10F',2),
('G','1G',2),('G','2G',2),('G','3G',2),('G','4G',2),('G','5G',2),('G','6G',2),('G','7G',2),('G','8G',2),('G','9G',2),('G','10G',2),
('H','1H',2),('H','2H',2),('H','3H',2),('H','4H',2),('H','5H',2),('H','6H',2),('H','7H',2),('H','8H',2),('H','9H',2),('H','10H',2),
('I','1I',2),('I','2I',2),('I','3I',2),('I','4I',2),('I','5I',2),('I','6I',2),('I','7I',2),('I','8I',2),('I','9I',2),('I','10I',2),
('J','1J',2),('J','2J',2),('J','3J',2),('J','4J',2),('J','5J',2),('J','6J',2),('J','7J',2),('J','8J',2),('J','9J',2),('J','10J',2),

('A','1A',3),('A','2A',3),('A','3A',3),('A','4A',3),('A','5A',3),('A','6A',3),('A','7A',3),('A','8A',3),('A','9A',3),('A','10A',3),
('B','1B',3),('B','2B',3),('B','3B',3),('B','4B',3),('B','5B',3),('B','6B',3),('B','7B',3),('B','8B',3),('B','9B',3),('B','10B',3),
('C','1C',3),('C','2C',3),('C','3C',3),('C','4C',3),('C','5C',3),('C','6C',3),('C','7C',3),('C','8C',3),('C','9C',3),('C','10C',3),
('D','1D',3),('D','2D',3),('D','3D',3),('D','4D',3),('D','5D',3),('D','6D',3),('D','7D',3),('D','8D',3),('D','9D',3),('D','10D',3),
('E','1E',3),('E','2E',3),('E','3E',3),('E','4E',3),('E','5E',3),('E','6E',3),('E','7E',3),('E','8E',3),('E','9E',3),('E','10E',3),
('F','1F',3),('F','2F',3),('F','3F',3),('F','4F',3),('F','5F',3),('F','6F',3),('F','7F',3),('F','8F',3),('F','9F',3),('F','10F',3),
('G','1G',3),('G','2G',3),('G','3G',3),('G','4G',3),('G','5G',3),('G','6G',3),('G','7G',3),('G','8G',3),('G','9G',3),('G','10G',3),
('H','1H',3),('H','2H',3),('H','3H',3),('H','4H',3),('H','5H',3),('H','6H',3),('H','7H',3),('H','8H',3),('H','9H',3),('H','10H',3),
('I','1I',3),('I','2I',3),('I','3I',3),('I','4I',3),('I','5I',3),('I','6I',3),('I','7I',3),('I','8I',3),('I','9I',3),('I','10I',3),
('J','1J',3),('J','2J',3),('J','3J',3),('J','4J',3),('J','5J',3),('J','6J',3),('J','7J',3),('J','8J',3),('J','9J',3),('J','10J',3),


('A','1A',4),('A','2A',4),('A','3A',4),('A','4A',4),('A','5A',4),('A','6A',4),('A','7A',4),('A','8A',4),('A','9A',4),('A','10A',4),
('B','1B',4),('B','2B',4),('B','3B',4),('B','4B',4),('B','5B',4),('B','6B',4),('B','7B',4),('B','8B',4),('B','9B',4),('B','10B',4),
('C','1C',4),('C','2C',4),('C','3C',4),('C','4C',4),('C','5C',4),('C','6C',4),('C','7C',4),('C','8C',4),('C','9C',4),('C','10C',4),
('D','1D',4),('D','2D',4),('D','3D',4),('D','4D',4),('D','5D',4),('D','6D',4),('D','7D',4),('D','8D',4),('D','9D',4),('D','10D',4),
('E','1E',4),('E','2E',4),('E','3E',4),('E','4E',4),('E','5E',4),('E','6E',4),('E','7E',4),('E','8E',4),('E','9E',4),('E','10E',4),
('F','1F',4),('F','2F',4),('F','3F',4),('F','4F',4),('F','5F',4),('F','6F',4),('F','7F',4),('F','8F',4),('F','9F',4),('F','10F',4),
('G','1G',4),('G','2G',4),('G','3G',4),('G','4G',4),('G','5G',4),('G','6G',4),('G','7G',4),('G','8G',4),('G','9G',4),('G','10G',4),
('H','1H',4),('H','2H',4),('H','3H',4),('H','4H',4),('H','5H',4),('H','6H',4),('H','7H',4),('H','8H',4),('H','9H',4),('H','10H',4),
('I','1I',4),('I','2I',4),('I','3I',4),('I','4I',4),('I','5I',4),('I','6I',4),('I','7I',4),('I','8I',4),('I','9I',4),('I','10I',4),
('J','1J',4),('J','2J',4),('J','3J',4),('J','4J',4),('J','5J',4),('J','6J',4),('J','7J',4),('J','8J',4),('J','9J',4),('J','10J',4),


('A','1A',5),('A','2A',5),('A','3A',5),('A','4A',5),('A','5A',5),('A','6A',5),('A','7A',5),('A','8A',5),('A','9A',5),('A','10A',5),
('B','1B',5),('B','2B',5),('B','3B',5),('B','4B',5),('B','5B',5),('B','6B',5),('B','7B',5),('B','8B',5),('B','9B',5),('B','10B',5),
('C','1C',5),('C','2C',5),('C','3C',5),('C','4C',5),('C','5C',5),('C','6C',5),('C','7C',5),('C','8C',5),('C','9C',5),('C','10C',5),
('D','1D',5),('D','2D',5),('D','3D',5),('D','4D',5),('D','5D',5),('D','6D',5),('D','7D',5),('D','8D',5),('D','9D',5),('D','10D',5),
('E','1E',5),('E','2E',5),('E','3E',5),('E','4E',5),('E','5E',5),('E','6E',5),('E','7E',5),('E','8E',5),('E','9E',5),('E','10E',5),
('F','1F',5),('F','2F',5),('F','3F',5),('F','4F',5),('F','5F',5),('F','6F',5),('F','7F',5),('F','8F',5),('F','9F',5),('F','10F',5),
('G','1G',5),('G','2G',5),('G','3G',5),('G','4G',5),('G','5G',5),('G','6G',5),('G','7G',5),('G','8G',5),('G','9G',5),('G','10G',5),
('H','1H',5),('H','2H',5),('H','3H',5),('H','4H',5),('H','5H',5),('H','6H',5),('H','7H',5),('H','8H',5),('H','9H',5),('H','10H',5),
('I','1I',5),('I','2I',5),('I','3I',5),('I','4I',5),('I','5I',5),('I','6I',5),('I','7I',5),('I','8I',5),('I','9I',5),('I','10I',5),
('J','1J',5),('J','2J',5),('J','3J',5),('J','4J',5),('J','5J',5),('J','6J',5),('J','7J',5),('J','8J',5),('J','9J',5),('J','10J',5),


('A','1A',6),('A','2A',6),('A','3A',6),('A','4A',6),('A','5A',6),('A','6A',6),('A','7A',6),('A','8A',6),('A','9A',6),('A','10A',6),
('B','1B',6),('B','2B',6),('B','3B',6),('B','4B',6),('B','5B',6),('B','6B',6),('B','7B',6),('B','8B',6),('B','9B',6),('B','10B',6),
('C','1C',6),('C','2C',6),('C','3C',6),('C','4C',6),('C','5C',6),('C','6C',6),('C','7C',6),('C','8C',6),('C','9C',6),('C','10C',6),
('D','1D',6),('D','2D',6),('D','3D',6),('D','4D',6),('D','5D',6),('D','6D',6),('D','7D',6),('D','8D',6),('D','9D',6),('D','10D',6),
('E','1E',6),('E','2E',6),('E','3E',6),('E','4E',6),('E','5E',6),('E','6E',6),('E','7E',6),('E','8E',6),('E','9E',6),('E','10E',6),
('F','1F',6),('F','2F',6),('F','3F',6),('F','4F',6),('F','5F',6),('F','6F',6),('F','7F',6),('F','8F',6),('F','9F',6),('F','10F',6),
('G','1G',6),('G','2G',6),('G','3G',6),('G','4G',6),('G','5G',6),('G','6G',6),('G','7G',6),('G','8G',6),('G','9G',6),('G','10G',6),
('H','1H',6),('H','2H',6),('H','3H',6),('H','4H',6),('H','5H',6),('H','6H',6),('H','7H',6),('H','8H',6),('H','9H',6),('H','10H',6),
('I','1I',6),('I','2I',6),('I','3I',6),('I','4I',6),('I','5I',6),('I','6I',6),('I','7I',6),('I','8I',6),('I','9I',6),('I','10I',6),
('J','1J',6),('J','2J',6),('J','3J',6),('J','4J',6),('J','5J',6),('J','6J',6),('J','7J',6),('J','8J',6),('J','9J',6),('J','10J',6),


('A','1A',7),('A','2A',7),('A','3A',7),('A','4A',7),('A','5A',7),('A','6A',7),('A','7A',7),('A','8A',7),('A','9A',7),('A','10A',7),
('B','1B',7),('B','2B',7),('B','3B',7),('B','4B',7),('B','5B',7),('B','6B',7),('B','7B',7),('B','8B',7),('B','9B',7),('B','10B',7),
('C','1C',7),('C','2C',7),('C','3C',7),('C','4C',7),('C','5C',7),('C','6C',7),('C','7C',7),('C','8C',7),('C','9C',7),('C','10C',7),
('D','1D',7),('D','2D',7),('D','3D',7),('D','4D',7),('D','5D',7),('D','6D',7),('D','7D',7),('D','8D',7),('D','9D',7),('D','10D',7),
('E','1E',7),('E','2E',7),('E','3E',7),('E','4E',7),('E','5E',7),('E','6E',7),('E','7E',7),('E','8E',7),('E','9E',7),('E','10E',7),
('F','1F',7),('F','2F',7),('F','3F',7),('F','4F',7),('F','5F',7),('F','6F',7),('F','7F',7),('F','8F',7),('F','9F',7),('F','10F',7),
('G','1G',7),('G','2G',7),('G','3G',7),('G','4G',7),('G','5G',7),('G','6G',7),('G','7G',7),('G','8G',7),('G','9G',7),('G','10G',7),
('H','1H',7),('H','2H',7),('H','3H',7),('H','4H',7),('H','5H',7),('H','6H',7),('H','7H',7),('H','8H',7),('H','9H',7),('H','10H',7),
('I','1I',7),('I','2I',7),('I','3I',7),('I','4I',7),('I','5I',7),('I','6I',7),('I','7I',7),('I','8I',7),('I','9I',7),('I','10I',7),
('J','1J',7),('J','2J',7),('J','3J',7),('J','4J',7),('J','5J',7),('J','6J',7),('J','7J',7),('J','8J',7),('J','9J',7),('J','10J',7);
insert into seat(row,seat_number,hall_id) values
('A','1A',8),('A','2A',8),('A','3A',8),('A','4A',8),('A','5A',8),('A','6A',8),('A','7A',8),('A','8A',8),('A','9A',8),('A','10A',8),
('B','1B',8),('B','2B',8),('B','3B',8),('B','4B',8),('B','5B',8),('B','6B',8),('B','7B',8),('B','8B',8),('B','9B',8),('B','10B',8),
('C','1C',8),('C','2C',8),('C','3C',8),('C','4C',8),('C','5C',8),('C','6C',8),('C','7C',8),('C','8C',8),('C','9C',8),('C','10C',8),
('D','1D',8),('D','2D',8),('D','3D',8),('D','4D',8),('D','5D',8),('D','6D',8),('D','7D',8),('D','8D',8),('D','9D',8),('D','10D',8),
('E','1E',8),('E','2E',8),('E','3E',8),('E','4E',8),('E','5E',8),('E','6E',8),('E','7E',8),('E','8E',8),('E','9E',8),('E','10E',8),
('F','1F',8),('F','2F',8),('F','3F',8),('F','4F',8),('F','5F',8),('F','6F',8),('F','7F',8),('F','8F',8),('F','9F',8),('F','10F',8),
('G','1G',8),('G','2G',8),('G','3G',8),('G','4G',8),('G','5G',8),('G','6G',8),('G','7G',8),('G','8G',8),('G','9G',8),('G','10G',8),
('H','1H',8),('H','2H',8),('H','3H',8),('H','4H',8),('H','5H',8),('H','6H',8),('H','7H',8),('H','8H',8),('H','9H',8),('H','10H',8),
('I','1I',8),('I','2I',8),('I','3I',8),('I','4I',8),('I','5I',8),('I','6I',8),('I','7I',8),('I','8I',8),('I','9I',8),('I','10I',8),
('J','1J',8),('J','2J',8),('J','3J',8),('J','4J',8),('J','5J',8),('J','6J',8),('J','7J',8),('J','8J',8),('J','9J',8),('J','10J',8);

select * from screening
insert into screening(no_of_seats_gold,no_of_seats_silver,s_branch_id,movie_id,hall_id,screening_start)values
(20,20,1,19,2,' 10:00:00'),
(20,20,2,18,3,'1:00:00'),
(20,20,3,12,4,'3:00:00'),
(20,20,4,13,6,'2:00:00'),
(20,20,5,12,7,'4:00:00'),
(20,20,3,11,5,'5:00:00'),
(20,20,4,10,1,'11:00:00'),
(20,20,5,1,2,'12:00:00'),
(20,20,6,2,4,'3:00:00'),
(20,20,2,3,5,'5:00:00'),
(20,20,1,5,3,'8:00:00'),
(20,20,4,6,7,'9:00:00'),
(20,20,3,7,5,'11:00:00'),
(20,20,2,13,6,'10:00:00'),
(20,20,5,2,2,'12:00:00'),
(20,20,6,19,1,'5:00:00'),
(20,20,1,11,7,'6:00:00'),
(20,20,3,2,4,'7:00:00'),
(20,20,4,4,2,'2:00:00'),
(20,20,3,5,7,'8:00:00'),
(20,20,5,7,6,'3:00:00'),
(20,20,2,8,2,'4:00:00'),
(20,20,5,9,4,'6:00:00'),
(20,20,4,2,1,'7:00:00'),
(20,20,2,1,6,'4:00:00'),
(20,20,1,4,2,'1:00:00');

select*from manager
insert into manager values
(1,'tehreem',2345678,2),
(2,'mehreen',5678678,1),
(3,'tayyab',0000678,5),
(4,'taha',1111118,3),
(5,'yousaf',565778,4),
(6,'abdullah',7868678,6);


insert into admin values
('100', 'Amit', 'Sinha', 'amitsinhT04@gmail.com', 35, '9846273634'),
('101', 'Raghav', 'Seth', 'seth.raghav987@gmail.com', 26, '7845279834'),
('102', 'Anjali', 'Gupta', 'anjali23g@gmail.com', 30, '8849273345'),
('103', 'Joy', 'Mathew', 'jmathew.123@gmail.com', 27, '9000567890'),
('104', 'Sudha', 'Sunil', 'sudha_sunil07@gmail.com', 47, '8874323461'),
('105', 'Ajay', 'Kumar', 'kumarajayv56@gmail.com', 19, '9078985643'),
('106', 'Vikram', 'Joshi', 'jvikram.89@gmail.com', 23, '7750912345'),
('107', 'Komal', 'Agarwal', 'komal.agarwal87@gmail.com', 15, '9345687654'),
('108', 'Maitri', 'Shah', 'maitrishahj1@gmail.com', 32, '9922345016'),
('109', 'Bhavya', 'Shastri', 'bhavyashastri@gmail.com', 25, '8567409098'),
('110', 'Preeti', 'Jain', 'preeti.jain@gmail.com', 18, '7765433211'),
('111',	'Shreya', 'Rathod','rathod_shreya@gmail.com',38,'9800215673'),
('112',	'Aditya', 'Rajesh','adityarajesh2902@gmail.com',21,'9108996762'),
('113',	'Keerti', 'Srivatsan','keertisri@gmail.com',25,'7707378654'),
('114',	'Rahul', 'Raghav','rahulrag@gmail.com',23,'9591990037'),
('115',	'Shrushti', 'Singh','shrushtikaul@gmail.com',19,'9900554017'),
('116',	'Mona', 'Mohammed','monaraisa@gmail.com',23,'9591670037'),
('117',	'Anushka', 'Sharma','sharmaanushka@gmail.com',40,'9902432497'),
('118',	'Yohanan', 'Veerappan','yohanv@gmail.com',44,'8231239804'),
('119',	'Kamala', 'Raghavendran','kamalag@gmail.com',32,'9594390037'),
('120',	'Janice', 'Fernandes','janicefernandes@gmail.com',38,'9325880785'),
('121',	'Sachin', 'Suresh','sachin1995@gmail.com',23,'9325880785'),
('122',	'Utham', 'Aiyappa','utham10@gmail.com',21,'8581654798'),
('123',	'Pranav', 'Gowda','pranavgowda06@gmail.com',37,'8846085689'),
('124',	'Krita', 'Prabhu','prabhukrita@gmail.com',20,'9098107054'),
('125',	'Aadrika', 'Bhandarkar','aadrikabhandarkar@gmail.com',28,'9895287453'),
('126',	'Sulohit', 'Avvaru','avvarusulohit1996@gmail.com',22,'7180867407'),
('127',	'Shriya', 'Bhimanadula','shriyab@gmail.com',35,'9055932134'),
('128',	'Ashmita', 'Rao','ashmitarao@gmail.com',27,'7191088921'),
('129',	'Nusaiba', 'Mehrunisa','nusaibafatima@gmail.com',24,'8731990037');



insert into movie values
(1,'you before me',200,300,500,250,1,75,1),
(2,'The witch',100,400,500,250,2,80,2),
(3,'The orphan',200,300,500,250,3,110,3),
(4,'The sky',200,300,500,250,4,90,4),
(5,'you before me',200,300,500,250,5,180,1),
(6,'never ending love',200,300,500,250,6,80,2),
(7,'its end with us',200,300,500,250,7,75,3),
(8,'its start with us',200,300,500,250,8,90,4),
(9,'alone',200,300,500,250,9,110,1),
(10,'alone 2',200,300,500,250,10,80,2),
(11,'hunting',200,300,500,250,11,90,3,4),
(12,'Bed rest ',200,300,500,250,12,190,1),
(13,'heartless',200,300,500,250,13,180,2),
(14,' old me',200,300,500,250,14,75,3),
(15,'new me',200,300,500,250,15,90,4),
(16,'you before me2',200,300,500,250,16,180,1),
(17,'you before me3',200,300,500,250,17,60,2),
(18,'you before me4',200,300,500,250,18,75,3),
(19,'you before me5',200,300,500,250,19,80,4);

select*from moviedetails
insert into moviedetails values('2-2-2023','romantic',4,'james and henry','English',1)
insert into moviedetails values('1304-1-20','Horror',1,'imraan hasmi','English',2)
insert into moviedetails values('2023-1-12','romantic',3,'imraan khan','English',3)
insert into moviedetails values('2014-2-22','romantic',5,'mehreen waseem','English',4)
insert into moviedetails values('2015-6-23','romantic',3,'kareena kapoor','English',5)
insert into moviedetails values('2009-7-27','romantic',5,'john cena','English',6)
insert into moviedetails values('2008-9-20','romantic',3,'katrina kaif','English',7)
insert into moviedetails values('2018-4-15','romantic',2,'salmaan khan','English',8)
insert into moviedetails values('2017-10-16','romantic',3,'shahrukh','English',9)
insert into moviedetails values('2014-6-19','horror',3,'arqam chuza','English',10)
insert into moviedetails values('2019-5-17','romantic',4,'tayyab khan zada','English',11)
insert into moviedetails values('2010-5-4','comedy',4,'tehreem','English',12)
insert into moviedetails values('2006-6-16','romantic',4,'abdullah','English',13)
insert into moviedetails values('2000-5-5','romantic',4,'james and henry','English',14)
insert into moviedetails values('2003-12-12','romantic',4,'yousaf','English',15)
insert into moviedetails values('2004-12-12','romantic',4,'jawad','English',16)
insert into moviedetails values('2009-3-3','romantic',5,'laiba','English',1)
insert into moviedetails values('2004-2-2','romantic',2,'james and henry','English',8)
insert into moviedetails values('2017-7-7','romantic',3,'james and henry','English',9)

select*from movietimings
insert into movietimings(movie_id,starting_time,ending_time,hall_id,duration_min) values
(1,'10:00:00','13:00:00',1,75),
(2,'13:00:00','16:00:00',1,80),
(3,'16:00:00','19:00:00',1,110),
(4,'19:00:00','22:00:00',1,90),
(5,'10:00:00','13:00:00',2,180),
(6,'13:00:00','16:00:00',2,80),
(7,'16:00:00','19:00:00',2,75),
(8,'19:00:00','22:00:00',2,90),
(9,'10:00:00','13:00:00',3,110),
(10,'13:00:00','16:00:00',3,80),
(11,'16:00:00','19:00:00',3,90),
(12,'19:00:00','22:00:00',3,190),
(13,'10:00:00','13:00:00',4,180),
(14,'13:00:00','16:00:00',4,75),
(15,'16:00:00','19:00:00',4,90),
(16,'19:00:00','22:00:00',4,180),
(17,'10:00:00','13:00:00',5,60),
(18,'13:00:00','16:00:00',5,75),
(19,'16:00:00','19:00:00',5,80);


select*from shows
insert into shows values(1,'you before me',200,300,500,250,1,'2:00')
insert into shows values(2,'The witch',100,400,500,250,2,'2:00')
insert into shows values(3,'The orphan',200,300,500,250,3,'2:00')
insert into shows values(4,'The sky',200,300,500,250,4,'2:00')
insert into shows values(5,'you before me',200,300,500,250,5,'2:00')
insert into shows values(6,'never ending love',200,300,500,250,6,'2:00')
insert into shows values(7,'its end with us',200,300,500,250,7,'2:00')
insert into shows values(8,'its start with us',200,300,500,250,8,'2:00')
insert into shows values(9,'alone',200,300,500,250,9,'2:00')
insert into shows values(10,'alone 2',200,300,500,250,10,'2:00')
insert into shows values(11,'hunting',200,300,500,250,11,'2:00')
insert into shows values(12,'Bed rest ',200,300,500,250,12,'2:00')
insert into shows values(13,'heartless',200,300,500,250,13,'2:00')
insert into shows values(14,' old me',200,300,500,250,14,'2:00')
insert into shows values(15,'new me',200,300,500,250,15,'2:00')
insert into shows values(16,'you before me2',200,300,500,250,16,'2:00')
insert into shows values(17,'you before me3',200,300,500,250,17,'2:00')
insert into shows values(18,'you before me4',200,300,500,250,18,'2:00')
insert into shows values(19,'you before me5',200,300,500,250,19,'2:00')


select*from showdetails
insert into showdetails values('2-2-2023','romantic',4,'james and henry','English',1)
insert into showdetails values('1304-1-20','Horror',1,'imraan hasmi','English',2)
insert into showdetails values('2023-1-12','romantic',3,'imraan khan','English',3)
insert into showdetails values('2014-2-22','romantic',5,'mehreen waseem','English',4)
insert into showdetails values('2015-6-23','romantic',3,'kareena kapoor','English',5)
insert into showdetails values('2009-7-27','romantic',5,'john cena','English',6)
insert into showdetails values('2008-9-20','romantic',3,'katrina kaif','English',7)
insert into showdetails values('2018-4-15','romantic',2,'salmaan khan','English',8)
insert into showdetails values('2017-10-16','romantic',3,'shahrukh','English',9)
insert into showdetails values('2014-6-19','horror',3,'arqam chuza','English',10)
insert into showdetails values('2019-5-17','romantic',4,'tayyab khan zada','English',11)
insert into showdetails values('2010-5-4','romantic',4,'tehreem','English',12)
insert into showdetails values('2006-6-16','romantic',4,'abdullah','English',13)
insert into showdetails values('2000-5-5','romantic',4,'james and henry','English',14)
insert into showdetails values('2003-12-12','romantic',4,'yousaf','English',15)
insert into showdetails values('2004-12-12','romantic',4,'jawad','English',16)
insert into showdetails values('2009-3-3','romantic',5,'laiba','English',1)
insert into showdetails values('2004-2-2','romantic',2,'james and henry','English',8)
insert into showdetails values('2017-7-7','romantic',3,'james and henry','English',9)

select*from showtimings
insert into showtimings(shows_id,starting_time,ending_time,hall_id) values
(1,'10:00:00','13:00:00',6),
(2,'13:00:00','16:00:00',6),
(3,'16:00:00','19:00:00',6),
(4,'19:00:00','22:00:00',6),
(5,'10:00:00','13:00:00',7),
(6,'13:00:00','16:00:00',7),
(7,'16:00:00','19:00:00',7),
(8,'19:00:00','22:00:00',7),
(9,'10:00:00','13:00:00',8),
(10,'13:00:00','16:00:00',8),
(11,'16:00:00','19:00:00',8),
(12,'19:00:00','22:00:00',8),
(13,'10:00:00','13:00:00',1),
(14,'13:00:00','16:00:00',1),
(15,'16:00:00','19:00:00',1),
(16,'19:00:00','22:00:00',1),
(17,'10:00:00','13:00:00',1),
(18,'13:00:00','16:00:00',1),
(19,'16:00:00','19:00:00',1);

select*from discounts
insert into discounts(discount_percent,active,shows_id,movie_id,validity_date,conditions,applicable_on) values
('22%',1,2,12,'2023-2-12','only on cards payments','gold_seat'),
('25%',0,2,3,'2023-4-12','only on cards payments','silver_seat'),
('50%',1,3,4,'2023-5-8','only on cards payments','silver_seat'),
('30%',1,4,5,'2023-6-5','only on cards payments','gold_seat'),
('25%',0,5,6,'2023-7-3','only on cards payments','silver_seat'),
('25%',1,6,7,'2023-12-2','only on cards payments','silver_seat'),
('30%',1,6,7,'2023-12-2','only on cards payments','silver_seat'),
('25%',1,12,7,'2023-11-20','only on cards payments','gold_seat'),
('25%',0,12,8,'2023-10-8','only on cards payments','silver_seat'),
('30%',1,14,9,'2023-3-7','only on cards payments','silver_seat'),
('50%',1,18,1,'2023-4-5','only on cards payments','gold_seat'),
('30%',0,18,1,'2023-4-5','only on cards payments','silver_seat'),
('25%',1,7,2,'2023-2-4','only on cards payments','silver_seat'),
('30%',1,4,12,'2023-7-3','only on cards payments','gold_seat'),
('25%',1,5,13,'2023-8-2','only on cards payments','silver_seat'),
('30%',0,8,4,'2023-1-12','only on cards payments','gold_seat'),
('25%',1,9,5,'2023-9-24','only on cards payments','silver_seat'),
('45%',1,19,12,'2023-2-23','only on cards payments','silver_seat'),
('25%',1,16,15,'2023-1-22','only on cards payments','gold_seat'),
('30%',1,2,3,'2023-2-2','only on cards payments','gold_seat');
 

select*from customer
insert into customer(fname,lname,gender,age,contact_add,cust_email,cust_password) values
('tasmiya','kiani','female',20,4854551,'tasmiya@','dew223'),
('saadia','rasool','female',34,4854552,'saadia@','feds44'),
('imraan',' khan','male',23,4854553,'imraan@','bmnbhgn'),
('mehreen',' waseem','female',45,4854557,'mehreen@','bnmmm'),
('kareena',' kapoor','female',56,4654557,'kareena@','cfgvbh'),
('john',' cena','male',34,4854657,'john@','dfgvhb'),
('katrina','kaif','female',20,4754557,'katrina@','dfvhbj'),
('salmaan',' khan','male',45,4854557,'salmaan@','dxcfgvh'),
('shahrukh','khan','male',18,4853557,'shahrukh@','xdfgvhb'),
('arqam chuza','ali','male',34,4864557,'arqam@','dfcgvh'),
('tayyab,',' khan zada','male',34,4254557,'tayyab@','zsdxfcg'),
('tehreem','aslam','female',45,4854157,'tehreem@','dfgvh'),
('abdullah','ahmed','male',60,4854587,'abdullah@','fgvhbn'),
('james ','bond','male',17,4854597,'james@','xfcgvhb'),
('yousaf','waseem','male',19,4850557,'yousaf@','xdfcgvbh'),
('jawad','khan','male',37,4854558,'jawad@','gvbhn'),
('laiba','ahmed','female',28,4850557,'laiba@','xfcgvhb'),
('james','henry','male',25,4854527,'james@','gvhbn'),
(' henry','james','male',40,4854557,'henry@','xdfcgvhb'),
('tasmiya','ahmed','female',46,4354557,'tasmiya@','xfgvhb'),
('saadia','khan','female',15,4856557,'saadia@','fcgvhb');


 select*from reservation
INSERT into  reservation values('BK12000000', 6, 2100, '3594888552401348', 'Janice Fernandes', 2, '100')
INSERT into reservation values('BK10100001', 5, 1750, '4600867746277489', 'Raghav Seth', 2, '114');
INSERT into reservation  values('BK10700002', 6, 2100, '5558062060974207', 'Komal Agarwal', 3, '101');
INSERT into reservation values('BK10500003', 3, 1050, '1715568540234971', 'Ajay Kumar', 4, '102');
INSERT into reservation values('BK11600004', 1, 350, '5396417845824659', 'Mona Mohammed', 5, '103');
INSERT into reservation values('BK10600005', 5, 1800, '6700075718329514', 'Vikram Joshi', 6, '104');
INSERT into reservation values('BK12900006', 10, 3700, '3366239730418338', 'Nusaiba Mehrunisa', 7, '105');
INSERT into reservation values('BK11400007', 9, 3350, '2170648806526324', 'Rahul Raghav', 8, '106');
INSERT into reservation values('BK12600008', 6, 2100, '8030551205048810', 'Sulohit Avvaru', 9, '107');
INSERT into reservation values('BK10800009', 4, 1500, '6369517485040577', 'Maitri Shah', 10, '108');
INSERT into reservation values('BK10000010', 7, 2550, '1100946878185874', 'Amit Sinha', 11, '109');
INSERT into reservation values('BK10300011', 9, 3300, '5721854946735779', 'Joy Mathew', 12, '108');
INSERT into reservation values('BK11300012', 5, 1850, '5082598172257230', 'Keerti Srivatsan', 13, '109');
INSERT into reservation values('BK12800013', 3, 1050, '6575600376664856', 'Ashmita Rao', 14, '110');
INSERT into reservation values('BK11200014', 4, 1400, '7022580821560455', 'Aditya Rajesh', 15, '111');
INSERT into reservation values('BK10000015', 4, 1400, '1303333985175724', 'Amit Sinha', 16, '112');
INSERT into reservation values('BK11100016', 4, 1400, '4294259470224084', 'Shreya Rathod', 17, '113');
INSERT into reservation values('BK11600017', 4, 1400, '8692866852988885', 'Mona Mohammed', 18, '114');
INSERT into reservation  values('BK11400018', 6, 2100, '7438443760955261', 'Rahul Raghav', 19, '115');
INSERT into reservation values('BK11900019', 6, 2300, '5954130176674979', 'Kamala Raghavendran', 1, '116');
INSERT into reservation values('BK10100020', 1, 350, '6289359508592847', 'Raghav Seth', 2, '117');
INSERT into reservation values('BK11300021', 4, 1400, '8882135475839272', 'Keerti Srivatsan', 3, '118');
INSERT into reservation values('BK11700022', 7, 2650, '4464474850275292', 'Anushka Sharma', 7, '119');
INSERT into reservation values('BK10700023', 6, 2100, '6245282133912608', 'Komal Agarwal', 10, '120');
INSERT into reservation values('BK12900024', 6, 2200, '9248307353076841', 'Nusaiba Mehrunisa', 1, '121');
INSERT into  reservation values('BK12000025', 2, 750, '3584580527480251', 'Janice Fernandes', 12, '122');
INSERT into reservation  values('BK10500026', 9, 3350, '8520638627020768', 'Ajay Kumar',5, '123');
INSERT into reservation values('BK10200027', 4, 1550, '2005290128127310', 'Anjali Gupta', 2, '124');
INSERT into reservation values('BK12100028', 5, 1750, '7204457804349640', 'Sachin Suresh', 1, '125');
INSERT into reservation values('BK11200029', 6, 2100, '8236325778781904', 'Aditya Rajesh', 12, '126');
INSERT into reservation values('BK12100030', 6, 2100, '5869012341510020', 'Sachin Suresh', 11, '127');
INSERT into reservation values('BK10100031', 1, 350, '2689511402752887', 'Raghav Seth', 10, '128');
INSERT into reservation values('BK11600032', 4, 1400, '3147004524405731', 'Mona Mohammed', 16, '129');
INSERT into reservation values('BK11500033', 4, 1400, '4805019035617790', 'Shrushti Singh', 15, '111');
INSERT into reservation values('BK11900034', 4, 1500, '9943897496212695', 'Kamala Raghavendran', 19, '111');
INSERT into reservation values('BK10600035', 2, 700, '7107018972114195', 'Vikram Joshi', 6, '112');
INSERT into reservation values('BK12200036', 5, 1950, '4958976068123281', 'Utham Aiyappa', 2, '113');
INSERT into reservation values('BK11400037', 2, 700, '8871773307164357', 'Rahul Raghav',14, '117');
INSERT into reservation values('BK12300038', 1, 350, '6244339723079426', 'Pranav Gowda', 13, '114');
INSERT into reservation values('BK11300039', 6, 2100, '6699462706453510', 'Keerti Srivatsan', 1, '116')
INSERT into reservation values('BK11800041', 4, 1400, '2319772239000055', 'Yohanan Veerappan', 18, '118');
INSERT into reservation values('BK12700042', 4, 1450, '5642591058582590', 'Shriya Bhimanadula', 7, '120');
INSERT into reservation values('BK10500043', 4, 1550, '7423954552292632', 'Ajay Kumar', 5, '121');
INSERT into reservation values('BK12500044', 5, 1750, '3518860411495232', 'Aadrika Bhandarkar', 5, '122');
INSERT into reservation values('BK12600045', 4, 1500, '6631827136747837', 'Sulohit Avvaru', 6, '123');
INSERT into reservation values('BK10400046', 6, 2200, '4552014618856066', 'Sudha Sunil', 4, '125');
INSERT into reservation values('BK10300047', 3, 1050, '3405659558862406', 'Joy Mathew', 3, '126');
INSERT into reservation values('BK10800048', 5, 1750, '7581924401592754', 'Maitri Shah', 8, '127');
INSERT into reservation values('BK12200049', 4, 1400, '2827060226892437', 'Utham Aiyappa', 2, '128');
INSERT into reservation values('BK12300050', 1, 350, '9662823518615219', 'Pranav Gowda', 1, '123');
INSERT into reservation values('BK11900051', 3, 1050, '9924524907575225', 'Kamala Raghavendran', 19, '127');
INSERT into reservation values('BK11800052', 4, 1400, '8846449745860888', 'Yohanan Veerappan', 18, '128');
INSERT into reservation values('BK10500053', 1, 350, '3481546317321750', 'Ajay Kumar', 5, '128')
INSERT into reservation values('BK10700054', 7, 2500, '2673980134313498', 'Komal Agarwal', 7, '111');
INSERT into reservation values('BK10100055', 4, 1550, '4050924590068346', 'Raghav Seth', 1, '108');
INSERT into reservation values('BK11600056', 5, 1750, '7480302606391164', 'Mona Mohammed', 16, '115');
INSERT into reservation values('BK10200057', 8, 2900, '4770703393986563', 'Anjali Gupta', 12, '105');
INSERT into reservation values('BK11700058', 8, 3050, '1108127518504772', 'Anushka Sharma', 17, '111');
INSERT into reservation values('BK11200059', 1, 350, '7127021037864500', 'Aditya Rajesh', 12, '111');
INSERT into reservation values('BK12900060', 7, 2650, '7369923953965786', 'Nusaiba Mehrunisa', 19, '100');
INSERT into reservation values('BK10000061', 2, 700, '8128533653062472', 'Amit Sinha', 10, '123');
INSERT into reservation values('BK11100062', 3, 1050, '1490631911872874', 'Shreya Rathod', 11, '112');
INSERT into reservation values('BK12400063', 7, 2700, '3013690251269442', 'Krita Prabhu', 14, '113');
INSERT into reservation values('BK12800064', 1, 350, '9650506633833056', 'Ashmita Rao', 18, '114');
INSERT into reservation values('BK12400065', 3, 975, '6745364689575901', 'Krita Prabhu', 14, '115');
INSERT into reservation values('BK11900066', 4, 1300, '9207830299334038', 'Kamala Raghavendran', 19, '107');
INSERT into reservation values('BK12900067', 2, 650, '3538347073827746', 'Nusaiba Mehrunisa', 19, '108');
INSERT into reservation values('BK10100068', 1, 325, '5990911935965954', 'Raghav Seth', 10, '105');
INSERT into reservation values('BK12600069', 1, 325, '2191834508565938', 'Sulohit Avvaru', 16, '106');
INSERT into reservation values('BK11200070', 4, 1300, '2611465883036793', 'Aditya Rajesh', 12, '103');
INSERT into reservation values('BK10500071', 1, 325, '1352722258040939', 'Ajay Kumar', 15, '102');
INSERT into reservation values('BK10300072', 4, 1300, '9016136210151775', 'Joy Mathew', 13, '111');
INSERT into reservation values('BK11800073', 4, 1300, '4398719506621905', 'Yohanan Veerappan', 18, '119');
INSERT into reservation values('BK10000074', 4, 1510, '9023681909771241', 'Amit Sinha', 10, '114');
INSERT into reservation values('BK11400075', 5, 1625, '1226535027347803', 'Rahul Raghav', 14, '115');
INSERT into reservation values('BK12100076', 10, 3530, '6078306827717486', 'Sachin Suresh', 1, '107');
INSERT into reservation values('BK10200077', 7, 2485, '7760847999748829', 'Anjali Gupta', 12, '120');
INSERT into reservation values('BK11300078', 6, 1950, '4202416925511807', 'Keerti Srivatsan', 13, '117');
INSERT into reservation values('BK11600079', 10, 3670, '1457460570510751', 'Mona Mohammed', 16, '112');
INSERT into reservation values('BK10700080', 1, 325, '7081228556020181', 'Komal Agarwal', 17, '112');
INSERT into reservation values('BK10900081', 6, 1950, '5882820692198495', 'Bhavya Shastri',9, '102');
INSERT into reservation values('BK11000082', 9, 3135, '8664719459409983', 'Preeti Jain', 10, '101');


select*from transactions
insert into transactions(card_number,e_ticket_id,res_id,t_cust_id,trans_date) values
(04425,1,'23',1,'2023-01-01'),
(04424,2,'1',2,'2023-01-01'),
(04423,3,'2',3,'2023-01-01'),
(04422,4,'3',4,'2023-01-01'),
(04421,5,'4',5,'2023-02-01'),
(04410,6,'5',6,'2023-02-01'),
(04419,7,'6',7,'2023-02-01'),
(04418,8,'7',8,'2023-02-01'),
(04417,9,'8',9,'2023-02-01'),
(04416,10,'9',10,'2023-01-01'),
(04415,11,'10',11,'2023-01-01'),
(04414,12,'11',12,'2023-01-01'),
(04413,13,'12',13,'2023-01-01'),
(04412,14,'13',11,'2023-01-01'),
(04400,2,'14',2,'2023-01-01'),
(04499,3,'15',4,'2023-01-01'),
(04488,4,'16',1,'2023-01-01'),
(04477,5,'17',5,'2023-02-01'),
(04466,6,'18',6,'2023-02-01'),
(04455,7,'19',9,'2023-01-01'),
(04444,8,'20',16,'2023-01-01'),
(04433,9,'21',3,'2023-01-01'),
(04411,10,'22',4,'2023-01-01');

select * from tickets
insert into tickets(ticket_id,ticket_number,accom_time,ticket_type,price_per_ticket,seat_number,t_cust_id,month) values
(50,01,'10:00:00','gold',550,3,1,'2023-01-1'),
insert into tickets(ticket_id,ticket_number,accom_time,ticket_type,price_per_ticket,seat_number,t_cust_id,month) values
(1,01,'10:00:00','gold',550,3,1,'2023-01-1'),
(2,02,'11:00:00','gold',550,450,2,'2023-01-1'),
(3,03,'2:00:00','silver',450,23,3,'2023-01-1'),
(4,04,'3:00:00','silver',450,112,4,'2023-01-1'),
(5,05,'9:00:00','gold',550,113,5,'2023-02-1'),
(6,06,'8:00:00','silver',450,89,6,'2023-02-1'),
(7,07,'7:00:00','gold',550,69,7,'2023-02-1'),
(8,08,'6:00:00','gold',550,100,8,'2023-02-1'),
(9,09,'2:00:00','silver',450,54,9,'2023-02-1'),
(10,10,'4:00:00','silver',450,45,10,'2023-03-1'),
(11,1,'2:00:00','gold',550,33,11,'2023-03-1'),
(12,2,'12:00:00','gold',550,30,12,'2023-03-1'),
(13,3,'1:00:00','silver',450,70,13,'2023-03-1'),
(14,4,'10:00:00','silver',450,73,14,'2023-04-1'),
(15,5,'9:00:00','gold',550,53,15,'2023-04-1'),
(16,6,'7:00:00','silver',450,43,16,'2023-04-1'),
(17,7,'6:00:00','gold',550,93,17,'2023-04-1'),
(18,8,'6:00:00','silver',450,99,18,'2023-05-1'),
(19,9,'6:00:00','silver',450,5,19,'2023-05-1'),
(20,07,'11:00:00','gold',550,70,20,'2023-05-1'),
(21,1,'10:00:00','silver',450,65,21,'2023-05-1'),
(22,2,'1:00:00','gold',550,98,1,'2023-06-1'),
(23,3,'2:00:00','silver',450,300,2,'2023-06-1'),
(24,4,'3:00:00','gold',550,52,3,'2023-06-1'),
(25,5,'4:00:00','silver',450,63,4,'2023-06-1'),
(26,6,'5:00:00','gold',550,44,5,'2023-07-1'),
(27,7,'6:00:00','silver',450,22,6,'2023-07-1'),
(28,2,'8:00:00','gold',550,33,7,'2023-07-1');


select*from reports
insert into reports values(1,'2023-01-1',null)



-------------------------------------------------------------------------------------------------------------
-------------------------------employee-data database insertions ------------------------------------------

insert into employee_info (e_name,e_father_name,e_DOB,e_contact_no ,e_join_date,e_email_address,e_address,employee_job )values
('Naseem','Anwar','3-2-1990',234098,'3-3-2001','naseeem@','johar town','finance manager'),
('anwar','Maqsood','4-3-1990',231233,'3-3-2001','anwar@','wapda town','music director'),
('waseem','shahrukh','5-6-1990',234789,'3-3-2001','waseem@','green city','technical staff'),
('tayyab','rohail','2-7-1990',2340998,'3-3-2001','tayyab@','bahria town','marketing director'),
('waleed','babar','2-8-1990',234123,'3-3-2001','waleed@','paragon city','screen operator'),
('wasif','Anwar','11-11-1990',234098,'3-3-2001','wasif@','sadar','admin staff'),
('Tehreem','Aslam','2-4-1990',234456,'3-3-2001','tehreem@','DHa phase 2','security manager'),
('atif','Aslam','2-5-1990',234778,'3-3-2001','atif@','DHA phase 3','cleaning staff'),
('wasif','aslam','2-2-1990',2349787,'3-3-2001','wasif@','johar town','sweeper'),
('mehreen','waseem','2-2-1990',234567,'3-3-2001','mehreen@','green town','finance manager'),
('abdullah','waseem','2-2-1990',231234,'3-3-2001','abdullah@','sadar','sweeper'),
('yousaf','waseem','2-2-1990',234123,'3-3-2001','yousaf@','gulshan park','attendents'),
('rana','Anwar','2-2-1990',234234,'3-3-2001','rana@','nishat colony','cleaning staff'),
('ayman','dar','2-2-1990',234666,'3-3-2001','ayman@','DHA phase 6','lacho'),
('azhar','Anwar','2-2-1990',234999,'3-3-2001','azhar@','DHA phase','manager'),
('chahat fateh ali','khan','2-2-1990',234000,'3-3-2001','chahat@','green land','music director'),
('urfi','javed','2-2-1990',785398,'3-3-2001','urfi@','dHA phase 8','manager'),
('Muushtak','haider','2-2-1990',234887,'3-3-2001','truyt@','h#2,street#1,johar town','manager');


select*from employee_salary
insert into employee_salary (sal_date,sal_amount,sal_status,s_eployee_id)values
('2023-1-1',1000,'paid',1),
('2023-1-1',10000,'unpaid',2),
('2023-1-1',10100,'paid',3),
('2023-1-1',20000,'unpaid',4),
('2023-1-1',30000,'paid',5),
('2023-1-1',40000,'unpaid',6),
('2023-1-1',50000,'paid',7),
('2023-1-1',10000,'unpaid',8),
('2023-1-1',18800,'paid',9),
('2023-1-1',1000,'paid',10),
('2023-1-1',20000,'unpaid',11),
('2023-1-1',1000,'unpaid',12),
('2023-1-1',10000,'paid',13),
('2023-1-1',10900,'unpaid',14),
('2023-1-1',10300,'paid',15),
('2023-1-1',10200,'unpaid',16),
('2023-1-1',1000,'paid',17),
('2023-1-1',10000,'unpaid',18);

select*from reports
insert into reports values(1,'2023-01-1',null)




-----------------------------------------------------------------------------------------------------------
---------------------------------cafeteria database insertions --------------------------------------------


insert into food_list(food_name,price,food_category) values

('Cheese Sandwich ', 100, 'Fast Food'),
('thai Sandwich ', 200, 'Fast Food'),
('korean Sandwich ', 300, 'Fast Food'),
('japanese Sandwich ', 200, 'Fast Food'),
('Arabic Sandwich ', 100, 'Fast Food'),
('cheese pasta ', 500, 'Fast Food'),
('spicy pasta ', 550, 'Fast Food'),
('sweeet pasta', 660, 'Fast Food'),
('white pasta ', 400, 'Fast Food'),
('red pasta ', 500, 'Fast Food'),
('chicken pizza ', 1000, 'Fast Food'),
('smooky noodles ', 1000, 'Fast Food'),
('egg rice ', 1000, 'Fast Food'),
('fried rice ', 1005, 'Fast Food'),
('lays', 100, 'Fast Food'),
('drinks ', 100, 'Fast Food'),
('kukure ', 100, 'Fast Food'),
('pringles ', 100, 'Fast Food'),
('boil eggs  ', 100, 'Fast Food'),
('Chicken burger ', 1500, 'Fast Food'),
('zinger burger ', 1700, 'Fast Food'),
('Cheese Sandwich ', 1200, 'Fast Food'),
('Cheese Sandwich ', 100, 'Fast Food');

select * from ordereditems
insert into ordereditems(quantity,order_date,totalprice,o_order_id,customer_name) values
(2,'2-2-2023',2010,14,'tasmiya'),
(3,'1304-1-20',3000,11,'saadia'),
(1,'2023-1-12',300,3,'imraan khan'),
(4,'2014-2-22',400,5,'mehreen waseem'),
(1,'2015-6-23',1000,13,'kareena kapoor'),
(5,'2009-7-27',500,15,'john cena'),
(3,'2008-9-20',300,23,'katrina kaif'),
(2,'2018-4-15',2400,22,'salmaan khan'),
(4,'2017-10-16',400,1,'shahrukh'),
(2,'2014-6-19',3400,21,'arqam chuza'),
(1,'2019-5-17',1005,14,'tayyab khan zada'),
(6,'2010-5-4',1200,4,'tehreem'),
(4,'2006-6-16',800,2,'abdullah'),
(1,'2000-5-5',500,6,'james '),
(2,'2003-12-12',1100,7,'yousaf'),
(5,'2004-12-12',3300,8,'jawad'),
(3,'2009-3-3',1200,9,'laiba'),
(1,'2004-2-2',100,19,'james'),
(4,'2017-7-7',6000,20,' henry'),
(2,'2-2-2023',2010,14,'tasmiya'),
(3,'1304-1-20',3000,11,'saadia');


select*from payment
insert into payment(quantity,payment_type,payment_amount,o_item_id,p_order_id,customer_name) values
(2,'cash',2010,14,1,'tasmiya'),
(3,'cash',3000,11,2,'saadia'),
(1,'cash',300,3,3,'imraan khan'),
(4,'cash',400,5,4,'mehreen waseem'),
(1,'cash',1000,13,5,'kareena kapoor'),
(5,'cash',500,15,6,'john cena'),
(3,'cash',300,23,7,'katrina kaif'),
(2,'cash',2400,22,8,'salmaan khan'),
(4,'cash',400,1,9,'shahrukh'),
(2,'cash',3400,21,10,'arqam chuza'),
(1,'cash',1005,14,11,'tayyab khan zada'),
(6,'cash',1200,4,12,'tehreem'),
(4,'cash',800,2,13,'abdullah'),
(1,'cash',500,6,14,'james '),
(2,'cash',1100,7,15,'yousaf'),
(5,'cash',3300,8,16,'jawad'),
(3,'cash',1200,9,17,'laiba'),
(1,'cash',100,19,18,'james'),
(4,'cash',6000,20,19,' henry');

select*from reports
insert into reports values(1,'2023-01-1',null)
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------




select  cinema.*, shows.*, movie.*
from cinema
join shows on cinema.cinema_id = shows.c_id
join movie on movie.c_id = cinema.cinema_id;
select movie.* , movietimings.*,moviedetails.*
from movie 
join movietimings on movie.id = movietimings.movie_id
join moviedetails on moviedetails.movie_id = movie.id;