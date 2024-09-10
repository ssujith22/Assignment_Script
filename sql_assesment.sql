Bonus
Title

-- Write a query to display all the first_name  in upper case
select upper(first_name) as first_name from Worker

-- Write a querty to display unique department from workers table
select distinct department from Worker

-- Write an SQL query to print the first three characters of FIRST_NAME from Worker table
select left(first_name,3) as first_name from Worker

-- Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
select INSTR(first_name,'a') as first_name from Worker where first_name = 'Amitabh'

-- Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length
select distinct department,LENGTH(department) from Worker

-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending
select * from Worker order by FIRST_NAME asc,DEPARTMENT desc

-- Write a query to get workers whose name are Vipul and Satish
select * from Worker where FIRST_NAME in ('Vipul','Satish')

-- Write an SQL query to print details of the Workers whose FIRST_NAME contains 'a'
select * from Worker where FIRST_NAME like '%a%'

-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets
select * from Worker where FIRST_NAME like '______h'

-- Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000
select * from Worker 
where SALARY between 100000 and 500000

-- Write an SQL query to print details of the Workers who have joined in Feb’2014
select * from Worker 
where year(joining_Date) = '2014' and month(joining_Date) = '02'  

-- Write an SQL query to fetch the count of employees working in the department ‘Admin’
select count(*) from Worker 
where department = 'Admin'

-- Write an SQL query to fetch the no. of workers for each department in the descending order
select count(*),department from Worker 
group by department 
order by count(*) desc

-- Write a query to display workerrs who are managers
select w.first_name, w.last_name, t.worker_title 
from Worker w
join Title t on w.worker_id = t.worker_Ref_id
where worker_title = 'Manager'

-- Write query to find duplicate rows title table
select worker_title,count(*) from Title
group by worker_title
having count(*) >1

-- Write an SQL query to show all workers who got the bonus along with bonus amount
select w.first_name, w.last_name, b.bonus_amount
from Worker w
join bonus b on w.worker_id = b.worker_Ref_id

-- Write a query to find employees in worker table that do not exist in bonus table (ie did not get bonus)
select w.first_name, w.last_name
from Worker w
where w.worker_id not in (select b.worker_Ref_id from bonus b where w.worker_id = b.worker_Ref_id)
--or
select w.first_name, w.last_name, b.bonus_amount
from Worker w
left join bonus b on w.worker_id = b.worker_Ref_id where b.worker_Ref_id is null

-- Write a query to find the highest 2 salaries
select * from Worker 
order by salary desc limit 2

-- Find 2nd highest without using TOP or LIMIT
with cte as
(
select *,dense_rank() over(order by salary desc)  as maxsal from Worker 
)
select * from cte where maxsal = 2

-- Find people who have the same salary
select w.first_name, w.last_name
from worker w
where w.salary in
(
select w.salary from worker w
group by w.salary
having count(*) >1
) 

-- Write a query to fetch 1st 50% records without using Top

-- Write a query to select a d`epartment with more than 3 people in worker table
select department,count(*) 'no of people' from worker
group by department
having count(*)>3

-- Write a query to select 1st and last row of a worker table

-- Write a query to select last 5 entries from worker table
select * from 
(
select * from Worker order by worker_id desc
)bb limit 5

-- Write a query to select people with highest salary in each group
with cte as
(
select *,dense_rank() over(partition by department order by salary desc)  as maxsal from Worker 
)
select * from cte where maxsal = 1

-- Write a query to fetch departments along with the total salaries paid for each of them
select sum(salary),department from Worker
group by department

-- Write a query to fetch the names of workers who earn the highest salary
with cte as
(
select *,dense_rank() over(order by salary desc)  as maxsal from Worker 
)
select first_name,last_name from cte where maxsal = 1