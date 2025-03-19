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
CREATE TABLE IF NOT EXISTS Teaches (
Id INT,
Course_id VARCHAR(20),
Sec_id INT,
Semester VARCHAR(20),
Year INT,
PRIMARY KEY(Id, Course_id, Sec_id) 
)
""")
conn_insert = "INSERT INTO Teaches(Id, Course_id, Sec_id, Semester, Year) VALUES(%s,%s,%s,%s,%s)"
conn_list = [
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
(98345, 'EE-181', 1, 'Spring', 2017)
]
cursor.executemany(conn_insert, conn_list)
conn.commit()
cursor.execute("SELECT * FROM Teaches")
for row in cursor.fetchall():
	print(row)
# Closing the connection
cursor.close()
conn.close()
