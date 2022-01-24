--CREATE TABLE Demo AND INSERT INTO 
Create Table EmployeeDemographics
(EmployeeID int ,
FirstName varchar (50),
LastName varchar (50),
Age int,
Gender varchar (50),
Nationality varchar (50)
)

Insert into EmployeeDemographics values
(101, 'Anna','Smith', 27, 'Female', 'Australian'),
(102, 'Angie', 'Martin', 29, NULL, 'Australian'),
(103, 'Phuong', 'Nguyen',41, 'Female', 'Vietnamese'),
(104, 'John', 'Lee',31, 'Male', 'Australian'),
(105, 'Burh', NULL,35, 'Male', 'Indian'),
(106, 'Austin', 'Cooper',36, 'Male', 'American'),
(107, 'Lily', 'June',28 ,'Female', NULL),
(108, 'Dwight', 'Schrute', 29, 'Male', 'German'),
(109, 'Angela', 'Martin', 31, 'Female','German'),
(NULL, 'Toby', 'Flenderson', 32, 'Male','American'),
(111, 'Michael', 'Scott', 35,NULL ,'Indian'),
(112, 'Michael', 'Scott', 35, 'Male',NULL)


--CREATE TABLE SAL AND INSERT INTO
Create Table EmployeeSalary
(EmployeeID int,
JobTitle varchar (50),
Salary int )

Insert into EmployeeSalary values
(101, 'Salesman', NULL),
(102, 'Receptionist', 30000),
(103, 'Salesman', 53000),
(104, NULL, 37000),
(NULL, 'HR', 52000),
(106, 'Regional Manager', 70000),
(107, 'Supplier Relations', 43000),
(108, 'Salesman', 53000),
(109, 'Accountant', NULL),
(110, 'HR', 53000),
(111, 'Regional Manager', 69000),
(112, 'Supplier Relations', 41000)


---INNER JOIN = A intersect B/ Full Outer Join = Outer join = Everything A and B/ Right Outer Join = Right Table, then left table/ 

Select *
From SQLTutorial.dbo.EmployeeDemographics

Select *
From SQLTutorial.dbo.EmployeeSalary

Select *
From SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
--Full Outer Join SQLTutorial.dbo.EmployeeSalary
--Left Outer Join SQLTutorial.dbo.EmployeeSalary
--Right Outer Join SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


--NOTICE: select EmployeeDemographics.EmployeeID instead of EmployeeID

Select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary  
From SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
--Left Outer Join SQLTutorial.dbo.EmployeeSalary
--Left Outer Join SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


Select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary  
From SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Where FirstName <> 'Lily'
Order By Salary DESC


Select JobTitle, Salary
From SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHere JobTitle ='Regional Manager'
Order By Salary asc

Select JobTitle, Avg(Salary)
From SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHere JobTitle ='Accountant'
Group By JobTitle

--TOPIC UNION

--Table 1 Insert
Insert into EmployeeDemographics values
(121,'Thomas', 'Domson', 25, 'Male', NULL),
(NULL, 'Luna', 'Colmin', NULL, NULL, NULL),
(122, 'Alex', 'Philis', NULL, 'Male', NULL)

--Table 3 Query
Create table WareHouseEmployeeDemographics
(EmployeeID int, FirstName varchar (50), LastName varchar(50),
Age int, Gender varchar (50), Nationality varchar (50))
--Table 3 Insert
Insert into WareHouseEmployeeDemographics values
(1013, 'Darryl', 'Philbin', NULL, 'Male','German'),
(1050, 'Roy', 'Anderson', 31, 'Male',NULL),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male',NULL),
(1052, 'Val', 'Johnson', 31, 'Female',NULL)

--UNION ALL
Select *
From SQLTutorial.dbo.EmployeeDemographics
UNION ALL
Select *
From SQLTutorial.dbo.WareHouseEmployeeDemographics
ORDER by EmployeeID

--UNION 

Select EmployeeID, FirstName, Age
From SQLTutorial.dbo.EmployeeDemographics
Union
Select EmployeeID, JobTitle, Salary 
From SQLTutorial.dbo.EmployeeSalary
ORDER by EmployeeID


--HAVING CLAUSE  (must in order: group by - having - order by) 
Select JobTitle, count(JobTitle)
From SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Group By JobTitle 
Having Avg(Salary)>45000 
Order by Avg(Salary) 

--CASE STATEMENT

Select FirstName, LastName, Age,
CASE 
	when Age =25 then 'Stanley'
	When Age >20 Then 'Old'
	When Age between 25 and 30 then 'young'
	Else 'baby'
End

From SQLTutorial.dbo.EmployeeDemographics
Where Age is not null
Order By Age

--Case and join 
Select FirstName, LastName, JobTitle, Salary,

CASE 
	when JobTitle ='Saleman' then Salary + (Salary * .10) 
	when JobTitle ='Account' then Salary + (Salary * .05) 
	when JobTitle ='HR' then Salary + (Salary * .00001) 
	else Salary + (Salary * .000005) 
END AS SalaryAfterRaise

From SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID




--UPDATING/DELETE DATA

----Excute Update first then Select/ or Both same time/cannot execute SELECT first
UPDATE SQLTutorial.DBO.EmployeeDemographics
Set Age =38, Gender= 'Female'
Where FirstName='Angie' and LastName='Martin'

Select *
From SQLTutorial.dbo.EmployeeDemographics


UPDATE SQLTutorial.DBO.EmployeeDemographics
Set EmployeeID =110
Where FirstName= 'Toby'
Select *
From SQLTutorial.dbo.EmployeeDemographics


UPDATE  SQLTutorial.DBO.EmployeeDemographics
Set Age=35, Gender='Female', Nationality = 'Switzerland'
Where FirstName= 'Luna' and LastName ='Colmin'

Select *
From SQLTutorial.dbo.EmployeeDemographics


--Delete From:caution once excute query, cannot get back data


Delete from SQLTutorial.dbo.EmployeeDemographics
where EmployeeID=112

--Recommnend this instead of Delete 
Select *
From SQLTutorial.dbo.EmployeeDemographics
where EmployeeID=112



--Partition By =

Select FirstName, Age, Gender, Salary,
	 Count (Gender) over (partition by Gender) as TotalGender
From SQLTutorial..EmployeeDemographics demo
JOin SQLTutorial..EmployeeSalary sal
on demo.EmployeeID= sal.EmployeeID

--Or

Select Gender, Count(Gender)
From SQLTutorial..EmployeeDemographics demo
JOin SQLTutorial..EmployeeSalary sal
on demo.EmployeeID= sal.EmployeeID
Where Gender is not null
Group by Gender



--Aliasing= temp. chaning col name 

Select FirstName + ' ' + LastName as FullName
From SQLTutorial.dbo.EmployeeDemographics

Select AVG(Age) As AvgAge
From SQLTutorial.dbo.EmployeeDemographics

--Aliasing = use short name to name tables
--Useful when we have many tables containing common variables

Select Demo.EmployeeID, Sal.Salary
From SQLTutorial.dbo.EmployeeDemographics as Demo
JOin SQLTutorial.dbo.EmployeeSalary as Sal
on Demo.EmployeeID = Sal.EmployeeID


Select demo.FirstName, sal.Salary, sal.JobTitle, wh.Gender
From SQLTutorial.dbo.EmployeeDemographics demo
Left Join SQLTutorial.dbo.EmployeeSalary sal
on demo.EmployeeID=sal.EmployeeID
Left Join SQLTutorial.dbo.WareHouseEmployeeDemographics wh
on demo.EmployeeID=wh.EmployeeID

