select * from petrescue;

--Exercise 2: Aggregate Functions

--Query A1: Enter a function that calculates the total cost of all animal rescues in the PETRESCUE table.
--Query A2: Enter a function that displays the total cost of all animal rescues in the PETRESCUE table in a column called SUM_OF_COST.
--Query A3: Enter a function that displays the maximum quantity of animals rescued.
--Query A4: Enter a function that displays the average cost of animals rescued.
--Query A5: Enter a function that displays the average cost of rescuing a dog.

select sum(cost) from petrescue;

select sum(cost) as sum_of_cost from petrescue;

select max(quantity) from petrescue;

select avg(cost) from petrescue;

select avg(cost/quantity) from petrescue 
where animal = 'Dog'
group by animal ;


--Exercise 3: Scalar and String Functions

--Query B1: Enter a function that displays the rounded cost of each rescue.
--Query B2: Enter a function that displays the length of each animal name.
--Query B3: Enter a function that displays the animal name in each rescue in uppercase.
--Query B4: Enter a function that displays the animal name in each rescue in uppercase without duplications.
--Query B5: Enter a query that displays all the columns from the PETRESCUE table, where the animal(s) rescued are cats. Use cat in lower case in the query.

select round(cost)as cost from petrescue;

select length(animal) from petrescue;

select ucase(animal) from petrescue;

select distinct ucase(animal) from petrescue;

select * from petrescue where lcase(animal)='cat';

--Exercise 4: Date and Time Functions

--Query C1: Enter a function that displays the day of the month when cats have been rescued.
--Query C2: Enter a function that displays the number of rescues on the 5th month.
--Query C3: Enter a function that displays the number of rescues on the 14th day of the month.
--Query C4: Animals rescued should see the vet within three days of arrivals. Enter a function that displays the third day from each rescue.
--Query C5: Enter a function that displays the length of time the animals have been rescued; the difference between today’s date and the rescue date.

select day(rescuedate) from petrescue where lcase(animal) = 'cat';

select sum(quantity) from petrescue where month(rescuedate) = 5;

select  sum(quantity) from petrescue where day(rescuedate) = 14;

select *, (rescuedate + 3) as third_day from petrescue;

select *,(current_date - rescuedate) as time_since_rescue from petrescue;

