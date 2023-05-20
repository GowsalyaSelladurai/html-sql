create table EmployeeDetails( 
EmpId int primary key,
FullName varchar(30) not null,
ManagerId int ,
DateOfJoining date,
City varchar(20)
);
insert into EmployeeDetails(empid,fullname,managerid,dateofjoining,city)
values(1, 'abi', 1, '2020-01-01', 'madras'),
       (2, 'maha', 1, '2000-02-15', 'theni'),
       (3, 'roshu', null, '2012-02-15', 'erode'),
       (4, 'nanthul̥', 1, '2017-03-05', 'salem');

create table EmployeeSalary(
EmpId int not null,
Project varchar(15) not null,
Salary decimal(10,2),
variable decimal(10,2),
foreign key(empid) references employeedetails(empid)
);
insert into EmployeeSalary(empid,project,salary,variable)
values(1, 'Project A', 5000.00, 1000.00),
       (1, 'Project B', 4500.00, 900.00),
       (2, 'Project A', 5500.00, 1100.00),
       (2, 'Project C', 6000.00, 1200.00),
       (3, 'Project B', 4000.00, 800.00);

1.SELECT EmployeeDetails.*
FROM EmployeeDetails
LEFT JOIN EmployeeSalary ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.EmpId IS NULL;

2.SELECT *
FROM EmployeeDetails
WHERE EmpId NOT IN (
  SELECT EmpId
  FROM EmployeeSalary
)

3.SELECT *
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020

4.SELECT a.*
FROM EmployeeDetails a
INNER JOIN EmployeeSalary b
  ON a.EmpId = b.EmpId

5.SELECT Project, COUNT(EmpId) as Noofemployee
FROM EmployeeSalary
GROUP BY Project

6.SELECT a.FullName, b.Salary
FROM EmployeeDetails a
LEFT JOIN EmployeeSalary b
  ON a.EmpId = b.EmpId

7.SELECT a.*
FROM EmployeeDetails a
INNER JOIN EmployeeDetails b
  ON a.EmpId = b.ManagerId

8.SELECT FullName, ManagerId, DateOfJoining, City, COUNT(*)
FROM EmployeeDetails
GROUP BY FullName, ManagerId, DateOfJoining, City
HAVING COUNT(*) > 1

9.SELECT *
FROM (
  SELECT * ,ROW_NUMBER() OVER (ORDER BY EmpId) AS rownum
  FROM EmployeeDetails
) AS r
WHERE r.RowNum % 2 = 1

10.SELECT DISTINCT Salary
FROM EmployeeSalary a
WHERE 3 = (
  SELECT COUNT(DISTINCT Salary)
  FROM EmployeeSalary b
  WHERE b.Salary > a.Salary
);
