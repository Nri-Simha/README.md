import mysql.connector as myconn
print(myconn.__version__)


import mysql.connector

# Connect to the MySQL server
connection = mysql.connector.connect(
    host="localhost",  # Replace with your MySQL host
    user="Santanu",       # Replace with your MySQL username
    password="Trd@0506"  # Replace with your MySQL password
)

cursor = connection.cursor()

# Create the user
create_user_query = "CREATE USER 'Santanu'@'localhost' IDENTIFIED BY 'Trd@0506';"
cursor.execute(create_user_query)

# Commit the changes
connection.commit()

# Close the cursor and connection
cursor.close()
connection.close()

print("User 'Santanu' created successfully.")

