import mysql.connector as myconn
print(myconn.__version__)


# Connect to the MySQL server
conn = myconn.connect(
    host="localhost",  # Replace with your MySQL host
    user="Pabitra",       # Replace with your MySQL username
    password="Trd@0506",
    database="Tarun" # Replace with your MySQL password
)

cursor = conn.cursor()
cursor.execute("""
CREATE TABLE IF NOT EXISTS Instructor (
Id INT PRIMARY KEY,
Name VARCHAR(20),
Dept_name varchar(20),
Salary INT

)
""")
conn_insert = "INSERT IGNORE INTO Instructor(Id, Name, Dept_name,Salary) VALUES(%s,%s,%s,%s)"
conn_list = [
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
(98345, 'Kim', 'Elec. Eng.', 80000),
(10211, 'Smith', 'Biology', 66000)
]
cursor.executemany(conn_insert, conn_list)
conn.commit()
cursor.execute("Delete from Instructor where (Id, Name, Dept_name, Salary)=(10211, 'Smith', 'Biology', 66000)")
conn.commit()
#cursor.execute("SELECT Name, Course_id FROM Instructor, Teaches where Instructor.Id = Teaches.Id")
#cursor.execute("Select Name from Instructor where Name like '%dt%'")
#cursor.execute("Select * from Instructor order by Salary")
#cursor.execute("select distinct Course_id from Teaches where (Semester = 'Fall' and Year=2017) or (Semester='Spring' and Year = 2018)")
#cursor.execute("select distinct Course_id from Teaches where Semester = 'Fall' and Year=2017 and Course_id in (Select Course_id from Teaches where Semester='Spring' and Year = 2018)")
cursor.execute("select distinct Course_id from Teaches where Semester = 'Fall' and Year=2017 and Course_id not in (Select Course_id from Teaches where Semester='Spring' and Year = 2018)")


for row in cursor.fetchall():
	print(row)
# Closing the connection
cursor.close()
conn.close()
