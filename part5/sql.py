import mysql.connector
from mysql.connector import Error


def execute(command: str):
    try:
        connection = mysql.connector.connect(host='localhost',
                                             database='resort',
                                             user='root',
                                             password='')
        if connection.is_connected():
            db_info = connection.get_server_info()
            print("Connected to MySQL Server version ", db_info)
            cursor = connection.cursor()
            cursor.execute(command)
            result = cursor.fetchall()
            print("Total number of rows in table: ", cursor.rowcount)
            print(result)
            connection.close()
            return True
    except Error as e:
        print("Error while connecting to MySQL", e)
        return False
