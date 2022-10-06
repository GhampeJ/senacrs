CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monica', 'Aurora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Carla', 'Werner', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Hans', 'Holzel', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Rino', 'Gaetano', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Franco', 'Battiato', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Rafael', 'Muller', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Sabrina', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Luana', 'Cruz', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 
 -- 1
select FIRST_NAME as WORKER_NAME from worker;
 
 -- 2
 select upper(FIRST_NAME) from worker;
 
 -- 3
 select distinct DEPARTMENT from Worker;
 
 -- 4
 
 select substring(FIRST_NAME,1,3) from WORKER;
 
 -- 5
 select rtrim(FIRST_NAME) from WORKER;
 
 -- 6
 
  select ltrim(DEPARTMENT) from WORKER;
  
  -- 7
  
  select distinct(length(DEPARTMENT)) from WORKER;
  
  -- 8
 
  select replace(FIRST_NAME,'a','A') from WORKER;
  
  -- 9
  select concat(FIRST_NAME," ",LAST_NAME) as COMPLET_NAME from WORKER;
  
  -- 10
  select * from WORKER order by FIRST_NAME asc;
  
  -- 11
  select * from WORKER 
  order by FIRST_NAME asc, DEPARTMENT DESC;
  
  -- 12
  select*from WORKER where DEPARTMENT= "Admin";
  
  -- 13
  select*from WORKER where FIRST_NAME like '%a%';
  
  -- 14
  select*from WORKER where FIRST_NAME like '%a';
  
  -- 15
  
  select * from WORKER
where SALARY between 100000 and 500000;

-- 16
select*from WORKER where JOINING_DATE 
between '14-02-01' and '14-02-28';

-- 17
select count(*) from WORKER where DEPARTMENT = 'admin';

-- 18
  select * from WORKER
where SALARY  >= 50000 and  SALARY <= 100000;

-- 19
select DEPARTMENT, COUNT(WORKER_ID) as QUANTIDADE FROM WORKER
group by DEPARTMENT order by QUANTIDADE DESC;

-- 20
select*from WORKER INNER JOIN TITLE ON WORKER.WORKER_ID = TITLE.WORKER_REF_ID
where TITLE.WORKER_TITLE LIKE 'manager';

-- 21
select WORKER_TITLE, AFFECTED_FROM, count(*)
from TITLE
group by WORKER_TITLE, AFFECTED_FROM
HAVING count(*) >1;

-- 22

select curdate();

-- 23

select DEPARTMENT, COUNT(WORKER_ID) as 'Number of worker'
from WORKER 
group by DEPARTMENT having count(WORKER_ID)>5;

-- 24

select t.DEPARTMENT,t.FIRST_NAME,t.SALARY from
(select max(Salary) as TotalSalary,DEPARTMENT from WORKER
group by DEPARTMENT) as TempNew
Inner Join WORKER t on TempNew.DEPARTMENT=t.DEPARTMENT
and TempNew.TotalSalary=t.Salary;

-- 25

select*from worker where mod(worker_id,2) <> 0;

-- 26


select*from worker where mod(worker_id,2) = 0;

-- 27

select*from worker order by salary desc limit 10;

-- 28

select distinct salary from worker w1
where 5 = (SELECT COUNT(distinct(w2.SALARY))
FROM WORKER W2 WHERE W2.SALARY>=w1.SALARY);

-- 29

SELECT distinct SALARY FROM WORKER 
group by SALARY
having COUNT(SALARY) >1;
select distinct w.worker_id, w.FIRST_NAME;

-- 30

select  max(salary) from worker
where salary not in (select max(salary)from worker);     

-- 31
select FIRST_NAME,DEPARTMENT from worker w where w.department='HR'
union all
select FIRST_NAME,DEPARTMENT from worker w1 where w1.department='HR';
-- 32
select department, count(worker_id) as 'number of workers'
from worker group by department having count(worker_id);

-- 33
select department, count(department) as 'number of worker'
from worker group by department;

-- 34

select *from worker where worker_id=(select max(worker_id)from worker);

-- 35

select*from worker where worker_id <=5
union
select*from (select*from worker w order by w.worker_id desc)as w1
where w1.worker_id <=5;

-- 36

select t.department,t.first_name,t.salary
from
(select max(salary) as totalsalary,department from worker group by department)as tempnew
inner join worker t on tempnew.department=t.department
and tempnew.totalsalary=t.salary;

