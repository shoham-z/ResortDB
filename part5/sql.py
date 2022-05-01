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
            print("Total number output rows: ", cursor.rowcount)
            connection.commit()
            connection.close()
            return result
    except Error as e:
        response = "Error while connecting to MySQL" + str(e)
        print(response)
        return response
