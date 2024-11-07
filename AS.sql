select * from employee

delete from employees where departmentid IN (


 drop table employee
create table employee ( employeeid int, first_name varchar(20), last_name varchar(20), departmentid int);


insert into employee 
select * from employees

WITH cte AS (
    SELECT 
        ctid,  -- Use ctid to uniquely identify rows
        departmentid, 
        ROW_NUMBER() OVER (PARTITION BY departmentid ORDER BY departmentid) AS dups
    FROM 
        employee
)
DELETE FROM employee
WHERE ctid IN (
    SELECT ctid 
    FROM cte 
    WHERE dups > 1
);


with cte as
(select ctid, employeeid, row_number() over (partition by departmentid order by departmentid) as dups from employees)
delete from  employees where ctid in (select ctid from cte where dups>1)






















 select distinct departmentid from employees