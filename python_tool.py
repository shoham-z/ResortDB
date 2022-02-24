from datetime import timedelta
from datetime import  datetime
import sqlite3
import random

def random_date(start, end):
    delta = end - start
    int_delta = (delta.days * 24 * 60 * 60) + delta.seconds
    random_second = random.randrange(int_delta)
    date_str = str(start + timedelta(seconds=random_second)).replace('-', '/')
    return datetime.strptime(date_str[:10], '%Y/%m/%d')

# Connecting to sqlite
conn = sqlite3.connect('identifier.sqlite')
  
# Creating a cursor object using the 
# cursor() method
cursor = conn.cursor()

  
# Queries to INSERT records.
for i in range(1, 101, 1):
    num_windows = random.randint(1, 5)
    max_people = random.randint(1, 10)
    price = 0
    if max_people < 5:
        price = 2000
    else:
        price = 4500
    command = 'INSERT INTO Room values (' + str(i) + ',' +str(num_windows) + ',' + str(max_people) + ',' + str(price) + ')'
    cursor.execute(command)

date1 = datetime.strptime('1/1/2019 1:30 PM', '%m/%d/%Y %I:%M %p')
date2 = datetime.strptime('2/23/2022 4:50 AM', '%m/%d/%Y %I:%M %p')
client_name_list = ['David Joyner', 'David Zuber', 'Brenton Joyner',
             'Brenton Zuber', 'Nicol Barthel', 'Shelba Barthel',
             'Shelba Crowley', 'Shelba Fernald', 'Shelba Odle',
             'Shelba Fry', 'Maren Fry']
for client_name in client_name_list:
    client_id = random.randrange(2123423, 3562352, 201)
    command = 'INSERT INTO Client values'+'(' + str(client_id) + "," + "\'" + client_name + "\'" + ')'
    cursor.execute(command)

date = str(random_date(date1, date2))[:10]
# Display data inserted
print("Data Inserted in the table: ")
data = cursor.execute('''SELECT * FROM Room''')
for row in data:
    print(row)
  
# Commit your changes in the database    
conn.commit()
  
# Closing the connection
conn.close()
