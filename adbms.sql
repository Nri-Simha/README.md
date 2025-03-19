drop table if exists instructor1;
CREATE TABLE instructor1(
ID int PRIMARY KEY NOT NULL,
name varchar(20) ,
dept_name varchar(20),
salary int
);
-- InserKon of elements
Insert into instructor1(ID, name, dept_name, salary)
VALUES
(10101, 'Srinivasan', 'Comp. Sci.', 65000),
(12121, 'Wu', 'Finance', 90000),
(15151, 'Mozart', 'Music', 40000),
(22222, 'Einstein', 'Physics', 95000),
(32343, 'El Said', 'History', 60000),
(33456, 'Gold', 'Physics', 87000),
(45565, 'Katz', 'Comp. Sci.', 75000),
(58583, 'Califieri', 'History', 62000),
(76543, 'Singh', 'Finance', 80000),
(76766, 'Crick', 'Biology', 72000),
(83821, 'Brandt', 'Comp. Sci.', 92000),
(98345, 'Kim', 'Elec. Eng.', 80000);

SELECT * FROM instructor1;

drop table if exists teaches;
CREATE TABLE teaches(
ID int(5),
Course_id varchar(20),
sec_id int,
semester varchar(20),
year int
);
---- Inser*on of elements
INSERT INTO teaches (ID, Course_id, sec_id, semester, year)

VALUES
(10101, 'CS-101', 1, 'Fall', 2017),
(10101, 'CS-315', 1, 'Spring', 2018),
(10101, 'CS-347', 1, 'Fall', 2017),
(12121, 'FIN-201', 1, 'Spring', 2018),
(15151, 'MU-199', 1, 'Spring', 2018),
(22222, 'PHY-101', 1, 'Fall', 2017),
(32343, 'HIS-351', 1, 'Spring', 2018),
(45565, 'CS-101', 1, 'Spring', 2018),
(45565, 'CS-319', 1, 'Spring', 2018),
(76766, 'BIO-101', 1, 'Summer', 2017),
(76766, 'BIO-301', 1, 'Summer', 2018),
(83821, 'CS-190', 1, 'Spring', 2017),
(83821, 'CS-190', 2, 'Spring', 2017),
(83821, 'CS-319', 2, 'Spring', 2018),
(98345, 'EE-181', 1, 'Spring', 2017);

SELECT * FROM teaches;
create role student;
drop view if exists faculty;
create view faculty as 
select ID, name, dept_name
from instructor1;
create view department_total_salary(dept_name, total_salary)
as select dept_name, sum(salary)
from instructor1
group by dept_name;
grant select on faculty to student;
create user 'Santanu'@'localhost' identified by 'Trd@0506';
grant student to Santanu;
revoke student from 'Santanu';
drop role student;
grant select on faculty to 'Santanu';

create table teaches2 as select * from teaches where 1=0;
alter table teaches2
add constraint check_semester
check(semester In ('Fall', 'Winter', 'Spring', 'Summer'));
