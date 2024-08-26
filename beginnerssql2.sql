use alex;

#Union
-- Union allows us to combine rows together not like coulmns in joins, combines rows of data from same table or different table ,
-- but you do it wuth one select statement combine with other select statement using union

select age, gender
 from employee_demographics 
union 
select salary, occupation from employee_salary ;
-- bydefault union gives distinct data
-- to get all the data we can use union all

select first_name ,last_name , 'old' as label
from employee_demographics 
where age > 50
union 
select first_name ,last_name , 'highly paid' as label
from employee_salary where salary > 70000;

#String fucntions
#length
select length('skyfall') ;

select first_name ,length(first_name) from employee_demographics ;

# upper
select upper('skyfall') ;

 # trim ,left trim or right trim ,removes white spaces
 select trim('         sky');
  select ltrim('         sky');
   select rtrim('         sky                ');
   
#substring length
select first_name , left(first_name ,4 ) from employee_demographics ; -- selection 4 characters fromleft side
-- can do exact same thing from right side
select substring(first_name ,2,4) from employee_demographics ;

#Replace
select first_name, replace(first_name , 'A', 'Z') from employee_demographics ; -- upper case A kanpisthe replacing with Z as shown ra unagamma,

#concat
select first_name, last_name , concat(first_name , last_name) as conactaed from employee_demographics ;


#case statement
select first_name, last_name , age,
case 
	when age <= 30 then 'Young'
    when age Between 31 and 50 then 'old'
    when age>= 50 then 'swargam'
end as your_future
from  employee_demographics ;

select first_name , salary,
case 
	when salary <50000 then salary + (salary * 100)
end as increment
from employee_salary;

#sybquery 
