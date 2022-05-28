import mysql.connector
from mysql.connector import Error


def execute(query: str):
    """
    Sends a query to the sql server and returns the result
    :param query: The query to execute
    :return: Output from the server
    """
    try:
        connection = mysql.connector.connect(host='localhost',
                                             database='resort',
                                             user='root',
                                             password='')
        if connection.is_connected():
            db_info = connection.get_server_info()
            print("Connected to MySQL Server version ", db_info)
            cursor = connection.cursor()
            cursor.execute(query)
            result = cursor.fetchall()
            print("Total number output rows: ", cursor.rowcount)
            connection.commit()
            connection.close()
            return result
    except Error as e:
        response = "Error while connecting to MySQL" + str(e)
        print(response)
        return response


def get_data_base_structure() -> str:
    """
    Gets the tables' structure in the database

    :return: list of the structure of the tables
    """
    structure = ""
    for table in get_data_base_tables():
        structure += get_table_structure(table)
    return structure


def get_data_base_tables() -> list:
    """
       Gets the tables' name in the database

       :return: list of the name of the tables
       """
    result = [item[0] for item in execute("SHOW TABLES;")]
    return result


def is_table(table: str) -> bool:
    """
    Checks if the table name passed to it is a table

    :param table: A table name
    :return: True if table exists, false if not
    """
    return True if str(table) in get_data_base_tables() else False


def get_table_structure(table) -> list:
    """
    Gets the table's columns names, types, and whether the field is a Primary key, Foreign key, or none

    :param table: The table name
    :return: List of the columns details
    """
    return execute("SHOW COLUMNS FROM " + table + ";")


def get_attributes(table) -> list:
    """
    Gets the table's columns names

    :param table: The table name
    :return: List of the columns names
    """

    return [item[0] for item in get_table_structure(table)]


def fetch_data(att: list, table: str):
    """
    Constructs a query to send to the server

    The query is to fetch data from a table where the data values equals to the values in att parameter

    :param att: The columns names and the data
    :param table: The table to fetch from
    :return:
    """
    where = ""
    for item in att:
        where += str(item[0]) + " = " + str(item[1]) + ", "
    return execute("SELECT * FROM " + str(table) + " WHERE " + where[:-2] + ";")


def delete_data(att: dict, table: str):
    """
    Constructs a query to send to the server

    The query is to delete data from a table where the data values equals to the values in att parameter

    :param att: The columns names and the data
    :param table: The table to fetch from
    :return:
    """
    where = ""
    for item in att:
        where += item + " = " + att[item] + ", "
    return execute("DELETE FROM " + str(table) + " WHERE " + where[:-2] + ";")


def update_data(att: dict, table: str, keys: dict):
    """
    Constructs a query to send to the server

    The query is to delete data from a table where the data values equals to the values in att parameter

    :param keys: Keys of table
    :param att: The columns names and the data
    :param table: The table to fetch from
    :return:
    """
    to_set = ""

    for item in att:
        to_set += item + " = " + (str(att[item]) if str(att[item]).isdigit() else "'" + att[item] + "'") + ", "

    where = "WHERE "
    for item in keys:
        where += item + " = " + (str(keys[item]) if str(keys[item]).isdigit() else "'" + keys[item] + "'") + ", "
    print("UPDATE " + str(table) + " SET " + to_set[:-2] + " " + where[:-2] + ";")
    return execute("UPDATE " + str(table) + " SET " + to_set[:-2] + " " + where[:-2] + ";")


def insert_data(data: dict, table: str):
    middle = ""
    for item in data:
        if item != '-TABLE-':
            if all(x.isalpha() or x.isspace() for x in data[item]):
                middle += "'" + data[item] + "' ,"
            else:
                middle += data[item] + " ,"

    return execute("INSERT INTO " + table + " VALUES(" + middle[:-2] + ");")


def get_columns(table: str, columns: list):
    """
    Retrieves the specified columns from the specified table

    :param table: The table to retrieve from
    :param columns: The columns to retrieve
    :return: The columns' data
    """
    command = "SELECT "
    for column in columns:
        command += column + "," if column != columns[-1] else column
    command += " FROM " + table + ";"
    return execute(command)
