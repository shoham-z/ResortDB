import sqlite3
import random
  
# Connecting to sqlite
conn = sqlite3.connect('identifier.sqlite')
  
# Creating a cursor object using the 
# cursor() method
cursor = conn.cursor()
  
# Creating table
#table ="""CREATE TABLE STUDENT(NAME VARCHAR(255), CLASS VARCHAR(255),SECTION VARCHAR(255));"""
#cursor.execute(table)
  
# Queries to INSERT records.
for i in range(1,101,1):
    num_windows = random.randint(1, 5)
    max_people = random.randint(1, 10)
    price = 0
    if max_people<5:
        price = 2000
    else:
        price = 4500
    command = 'INSERT INTO Room values'  +'(' + str(i) + ',' +str(num_windows) + ',' + str(max_people) + ',' + str(price) + ')' 
    cursor.execute(command)

# Display data inserted
print("Data Inserted in the table: ")
data=cursor.execute('''SELECT * FROM Room''')
for row in data:
    print(row)
  
# Commit your changes in the database    
conn.commit()
  
# Closing the connection
conn.close()