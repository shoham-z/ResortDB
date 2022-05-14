import PySimpleGUI as sg
from sql import execute


def pop_up_window(message: str):
    """
    Creates a new pop-up window with notification to the user
    :param message: The notification
    :return: None
    """
    layout2 = [[sg.Text(text=message), sg.Button(button_text="Close", enable_events=True)]]
    window2 = sg.Window(message, layout2)

    while True:
        event, values = window2.read()
        if event == sg.WIN_CLOSED or event == 'Close':
            break
    window2.close()


def confirm_delete(message: str, data: tuple):
    """
    Constructs a new confirmation window and displays it to the user, and waits to his response
    :param data: The data to delete if the user confirms
    :param message: The massage to the user
    :return: Whether the user confirmed or not
    """
    layout2 = [[sg.Text(text=message[:-1] + ": " + str(data))],
               [sg.Button(button_text="Yes", enable_events=True), sg.Button(button_text="No", enable_events=True)]]
    window2 = sg.Window(message, layout2)

    while True:
        event, values = window2.read()
        if event == sg.WIN_CLOSED or event == 'Close':
            window2.close()
            return False
        elif event == "Yes" or event == "No":
            window2.close()
            return True if event == "Yes" else False


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


def fetch_data(att: dict, table: str):
    """
    Constructs a query to send to the server

    The query is to fetch data from a table where the data values equals to the values in att parameter

    :param att: The columns names and the data
    :param table: The table to fetch from
    :return:
    """
    where = ""
    for item in att:
        where += item + " = " + att[item] + ", "
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


def construct_window(name: str) -> sg.Window:
    """
    Constructs a window with a name and type defined be the name
    :param name: Name of the window
    :return: The new window
    """
    layout = []
    if name == "Boarding house Data-Base":
        layout = [[sg.Button(button_text='Insert', key="-INSERT-"), sg.Button(button_text='Update', key="-UPDATE-"),
                   sg.Button(button_text='Delete', key="-DELETE-"),
                   sg.Button(button_text='Get Record', key="-PULL-DATA-"),
                   sg.Button(button_text='Queries', key="-QUERIES-")],
                  [sg.Button('Close')]]
    elif name == "Insert" or name == "Update":
        layout = [[sg.Text(text="Table"), sg.Input(key='-TABLE-'),
                   sg.Button(button_text="Submit", enable_events=True, key="table")]]
    elif name == "Delete" or name == "Get Record":
        if name == "Delete":
            txt = "What table do you want to delete records from?"
        else:
            txt = "What table do you want to get records from?"
        layout = [[sg.Text(text=txt)],
                  [sg.Input(key='-TABLE-'), sg.Button(button_text="Submit", enable_events=True, key="table")]]
    return sg.Window(name, layout)


def main():
    bigger_font = ("Arial", 11)
    sg.set_options(font=bigger_font)

    sg.theme('DarkAmber')

    # Create the Window
    window = construct_window("Boarding house Data-Base")
    # Event Loop to process "events" and get the "values" of the inputs
    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == 'Close':  # if user closes window or clicks cancel
            break
        if event == "-INSERT-":
            insert()
            event = ""
        if event == "-UPDATE-":
            update()
            event = ""
        if event == "-DELETE-":
            delete()
            event = ""
        if event == "-PULL-DATA-":
            get_record()
            event = ""
        if event == "-QUERIES-":
            run_procedures()

    window.close()


def insert():
    """
    This function is all about operating the insert window and its related activities
    :return: None
    """
    window = construct_window("Insert")

    inserted_successfully = False

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == 'Close':
            break
        elif event == "table":
            if is_table(values['-TABLE-']):
                columns = get_table_structure(values['-TABLE-'])
                lst = [[item[0], item[1], "key" if item[3] == 'PRI' else ""] for item in columns]
                window.extend_layout(window, [[sg.Text(text="Table structure is: \n")]])
                for item in lst:
                    txt = "(" + item[2] + ") " + item[0] + ": " + item[1] if item[2] == 'key' else item[0] + ": " + \
                                                                                                   item[1]
                    window.extend_layout(window,
                                         [[sg.Text(text=txt), sg.Input(key='-' + item[0] + '-')]])
                window.extend_layout(window, [[sg.Button(button_text="Submit", enable_events=True, key="data")]])
            else:
                window.extend_layout(window, [[sg.Text('Table does not exist')]])
        elif event == "data":
            middle = ""
            for item in values:
                if item != '-TABLE-':
                    if all(x.isalpha() or x.isspace() for x in values[item]):
                        middle += "'" + values[item] + "' ,"
                    else:
                        middle += values[item] + " ,"
            prefix = "INSERT INTO " + values['-TABLE-'] + " VALUES("
            suffix = ");"
            command = prefix + middle[:-2] + suffix
            response = execute(command)
            print("\n\n")
            if "Total number" in response:
                inserted_successfully = True
                pop_up_window("Data Inserted Successfully")
            elif '23000' in response:
                pop_up_window("Key already Exists")
            elif '22007' in response:
                pop_up_window("Incorrect data types")

        if inserted_successfully:
            window.extend_layout(window, [[sg.Button(button_text="Close")]])

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == 'Close':
            break
    window.close()


def update():
    """
       This function is all about operating the update window and its related activities
       :return: None
    """
    window = construct_window("Update")
    updated_successfully = False

    attributes = []

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == 'Close':
            break
        elif event == "table":  # Entered the table name, now moving to creating new line for each key of the table, to insert values
            if str(values['-TABLE-']) in get_data_base_tables():
                columns = get_table_structure(values['-TABLE-'])
                attributes = [item[0] for item in columns]

                # Creates a list of all the keys of the table
                lst = [[item[0], item[1], "key"] if item[3] == 'PRI' else None for item in
                       columns]

                window.extend_layout(window, [[sg.Text(text="Please enter the key(s) of the record you'd like to "
                                                            "update:")]])
                print(lst)
                for item in lst:  # Creates new line input field for each key
                    if item is not None:
                        window.extend_layout(window,
                                             [[sg.Text(text=item[0]), sg.Input(key='-' + item[
                                                 0] + '-'), ]])
                # New button to submit key's values
                window.extend_layout(window, [[sg.Button(button_text="Submit", enable_events=True,
                                                         key="update")]])
            else:
                window.extend_layout(window, [[sg.Text('Table does not exist')]])
        elif event == "update":  # User pressed on the submit button created on line 219, now creating
            print(values)
            fetch_data(dict(zip(lst, [values["-" + att + "-"] for att in lst])), values["-Table-"])
            updated_successfully = True
            pop_up_window("Data Updated Successfully")
        if updated_successfully:
            window.extend_layout(window, [[sg.Button(button_text="Close")]])

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == 'Close':
            break
    window.close()


def delete():
    """
        This function is all about operating the delete window and its related activities
        :return: None
    """
    window = construct_window("Delete")

    got_record = True

    attributes = []
    lst = []

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == 'Close':
            break
        elif event == "table":  # Entered the table name, now moving to creating new line for each key of the table, to insert values
            if str(values['-TABLE-']) in get_data_base_tables():
                columns = get_table_structure(values['-TABLE-'])
                attributes = [item[0] for item in columns]

                # Creates a list of all the keys of the table
                lst = [[item[0], item[1], "key"] if item[3] == 'PRI' else None for item in
                       columns]

                window.extend_layout(window, [[sg.Text(text="Please enter the key of the record you'd like to get:")]])
                for item in lst:  # Creates new line input field for each key
                    if item is not None:
                        window.extend_layout(window,
                                             [[sg.Text(text=item[0]), sg.Input(key='-' + item[
                                                 0] + '-'), ]])
                # New button to submit key's values
                window.extend_layout(window, [[sg.Button(button_text="Submit", enable_events=True,
                                                         key="delete-record")]])
            else:
                window.extend_layout(window, [[sg.Text('Table does not exist')]])
        elif event == "delete-record":  # User pressed on the submit button created on line 219, now to fetch data
            keys: list = [item[0] for item in lst if item is not None]
            keys_values: list = [values['-' + item[0] + '-'] for item in lst if item is not None]
            att: dict = dict(zip(keys, keys_values))

            result = fetch_data(att, values['-TABLE-'])

            if confirm_delete("Are you sure you want to delete this record?", result):
                try:
                    delete_data(att, values['-TABLE-'])
                except:
                    pop_up_window("Key does not exist")

                got_record = True
                pop_up_window("Deleted data Successfully")
        if got_record:
            window.extend_layout(window, [[sg.Button(button_text="Close")]])


def get_record():
    """
        This function is all about operating the get-record window and its related activities
        :return: None
     """
    window = construct_window("Get Record")

    got_record = True

    attributes = []
    lst = []
    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == 'Close':
            break
        elif event == "table":  # Entered the table name, now moving to creating new line for each key of the table, to insert values
            if str(values['-TABLE-']) in get_data_base_tables():
                columns = get_table_structure(values['-TABLE-'])
                attributes = [item[0] for item in columns]

                # Creates a list of all the keys of the table
                lst = [[item[0], item[1], "key"] if item[3] == 'PRI' else None for item in
                       columns]

                window.extend_layout(window, [[sg.Text(text="Please enter the key of the record you'd like to get:")]])
                for item in lst:  # Creates new line input field for each key
                    if item is not None:
                        window.extend_layout(window,
                                             [[sg.Text(text=item[0]), sg.Input(key='-' + item[
                                                 0] + '-'), ]])
                # New button to submit key's values
                window.extend_layout(window, [[sg.Button(button_text="Submit", enable_events=True,
                                                         key="get-record")]])
            else:
                window.extend_layout(window, [[sg.Text('Table does not exist')]])
        elif event == "get-record":  # User pressed on the submit button created on line 219, now to fetch data
            keys: list = [item[0] for item in lst if item is not None]
            keys_values: list = [values['-' + item[0] + '-'] for item in lst if item is not None]
            att: dict = dict(zip(keys, keys_values))

            result = fetch_data(att, values['-TABLE-'])

            if len(result) > 0:
                for index in range(len(result)):  # Creates new line for each record
                    window.extend_layout(window,
                                         [[sg.Text(text=attributes[index] + "=" + str(result[index]))]])
            else:
                window.extend_layout(window,
                                     [[sg.Text(text="Record does not exist!")]])
            got_record = True
            pop_up_window("Fetched data Successfully")
        if got_record:
            window.extend_layout(window, [[sg.Button(button_text="Close")]])


def run_procedures():
    pass


if __name__ == "__main__":
    main()
