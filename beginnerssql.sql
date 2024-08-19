select * from employee_demographics;

#can do calculations in select statement
select first_name,age , (age+10) * 10 from employee_demographics;

#arthematic operators
select * from employee_salary
where salary > 50000;
select * from employee_demographics
where birth_date > '1985-01-01';

#logical operators
select * from employee_demographics 
where (first_name = 'Leslie' and age = 44) or age >55;

# like operator 
-- % means anyrhing , _ means specific value
select first_name from employee_demographics 
where first_name like 'Jer%';
select first_name from employee_demographics 
where first_name like 'a__'; -- returns starts with a and has only two charatcers - or ann 

#groupby
-- group by,aggregation ki vaadkoch, avg,count,min,max
-- distinct you can use the DISTINCT function to retrieve unique results
select gender, avg(age) from employee_demographics
group by gender;

#orderby
select * from employee_demographics order by first_name;-- asc default , dsc 

#having -where groupby having
/* select gender ,avg(age) from employee_demographics
where avg(age) > 40
group by gender;*/ -- doesnt work
-- where vs having
select gender ,avg(age) from employee_demographics
group by gender 
having avg(age) > 40;
select occupation, avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) >75000;

#limit and aliasing
select first_name,age from employee_demographics 
order by age
limit 3;
select gender, avg(age) as avg_age from employee_demographics
group by gender 
having avg(age) > 40; -- can write  having avg_age >40;




#Joins inner join, outer lo ,left outer join, right outer join, selef join
select * from employee_salary
employee_demographics;
 select * from employee_demographics;

-- inner joins return rows that are the same in both columns
select * from employee_demographics inner join employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id;
-- using alias
select * from employee_demographics as dem inner join employee_salary as sal
	ON dem.employee_id = sal.employee_id;
    
-- a left join will take everything from the left table even if there is no match in the join, but will only return matches from the right table
select * from employee_demographics as dem left join employee_salary as sal
	ON dem.employee_id = sal.employee_id;
-- a right join will take everyting from the right table even if there is no match in the join, nut will only return matvhes from the left table
-- Since there is not match on the right table it's just all Nulls
select * from employee_demographics as dem right join employee_salary as sal
	ON dem.employee_id = sal.employee_id;


-- Self Join
-- a self join is where you tie a table to itself
select  *
from employee_salary emp1 
join employee_salary emp2 on emp1.employee_id = emp2.employee_id;
--
select * from employee_salary emp1
join employee_salary emp2 on emp1.employee_id + 1  = emp2.employee_id ;