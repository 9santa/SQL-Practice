# Subqueries

#So subqueries are queries within queries. Let's see how this looks.

SELECT gender
FROM employee_demographics
group by gender;

select *
from employee_salary;


#Now let's say we wanted to look at employees who actually work in the Parks and Rec Department, we could join tables together or we could use a subquery
#We can do that like this:

SELECT *
FROM employee_demographics
WHERE employee_id IN 
			(SELECT employee_id
				FROM employee_salary
                WHERE dept_id = 1);
                
#So we are using that subquery in the where statement and if we just highlight the subwuery and run it it's basically a list we are selecting from in the outer query

SELECT *
FROM employee_demographics
WHERE employee_id IN 
			(SELECT employee_id, salary
				FROM employee_salary
                WHERE dept_id = 1);

# now if we try to have more than 1 column in the subquery we get an error saying the operand should contain 1 column only 

#We can also use subqueries in the select and the from statements - let's see how we can do this

-- Let's say we want to look at the salaries and compare them to the average salary

SELECT *, AVG(salary)
FROM employee_salary;
-- if we run this it's not going to work, we are using columns with an aggregate function so we need to use group by
-- if we do that though we don't exactly get what we want

-- it's giving us the average PER GROUP which we don't want
-- here's a good use for a subquery

SELECT first_name, 
salary, 
(SELECT AVG(salary) 
	FROM employee_salary) as avg_salary,
salary, occupation
FROM employee_salary;



-- We can also use it in the FROM Statement
-- when we use it here it's almost like we are creating a small table we are querying off of

SELECT gender, MIN(age), MAX(age), COUNT(age), AVG(age)
FROM employee_demographics
group by gender
having gender = 'female'
union
SELECT gender, MIN(age), MAX(age), COUNT(age), AVG(age)
FROM employee_demographics
group by gender
having gender = 'male'
;

SELECT gender
FROM employee_demographics
where gender = 'female'
;

SELECT AVG(Min_age), avg(max_age)
FROM (SELECT gender, MIN(age) Min_age, MAX(age) Max_age, COUNT(age) Count_age, AVG(age) Avg_age
FROM employee_demographics
GROUP BY gender) AS Agg_Table
;

select *
from
(SELECT gender, MIN(age) Min_age, MAX(age) Max_age, COUNT(age) Count_age ,AVG(age) Avg_age
FROM employee_demographics
GROUP BY gender) AS Agg_Table
;



























