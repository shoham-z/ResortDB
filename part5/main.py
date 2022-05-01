import PySimpleGUI as sg
from sql import execute


def pop_up_window(message):
    layout2 = [[sg.Text(text=message), sg.Button(button_text="Close", enable_events=True)]]
    window2 = sg.Window(message, layout2)

    while True:
        event, values = window2.read()
        if event == sg.WIN_CLOSED or event == 'Close':
            break
    window2.close()


def get_data_base_structure():
    structure = ""
    for table in get_data_base_tables():
        structure += get_table_structure(table)
    return structure


def get_data_base_tables():
    result = [item[0] for item in execute("SHOW TABLES;")]
    return result


def is_table(table):
    return True if str(table) in get_data_base_tables() else False


def get_table_structure(table):
    return execute("SHOW COLUMNS FROM " + table + ";")


def get_attributes(table):
    return [item[0] for item in get_table_structure(table)]


def fn(att: dict, table: str):
    where = ""
    for item in att:
        where += item + "=" + att[item] + " "
    print("SELECT * FROM " + str(table) + " WHERE " + where[:-1] + ";")
    # execute("SELECT * FROM " + str(table) + " WHERE " + where[:-1] + ";")


def construct_window(name: str):
    layout = []
    if name == "Mini Project Data-Base":
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
            txt = "What table do you want to delete records from? \n"
        else:
            txt = "What table do you want ot get records from? \n"
        layout = [[sg.Text(text=txt)],
                  [sg.Input(key='-TABLE-'), sg.Button(button_text="Submit", enable_events=True, key="table")]]
    return sg.Window(name, layout)


def main():
    bigger_font = ("Arial", 11)
    sg.set_options(font=bigger_font)

    sg.theme('DarkAmber')

    # Create the Window
    window = construct_window("Mini Project Data-Base")
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
            pass

    window.close()


def insert():
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
    window = construct_window("Update")
    updated_successfully = False

    attributes = []

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == 'Close':
            break
        elif event == "table":
            if str(values['-TABLE-']) in get_data_base_tables():
                columns = get_table_structure(values['-TABLE-'])
                attributes = [item[0] for item in columns]
                lst = [[item[0], item[1], "key"] if item[3] == 'PRI' else None for item in columns]
                window.extend_layout(window, [[sg.Text(text="Please enter the key(s) of the record you'd like to "
                                                            "update:")]])
                for item in lst:
                    if item is not None:
                        window.extend_layout(window,
                                             [[sg.Text(text=item[0]), sg.Input(key='-' + item[0] + '-'), ]])
                window.extend_layout(window, [[sg.Button(button_text="Submit", enable_events=True, key="update")]])
            else:
                window.extend_layout(window, [[sg.Text('Table does not exist')]])
        elif event == "update":
            print(values)
            fn(dict(zip(attributes, [values["-" + att + "-"] if for att in attributes])), values["-Table-"])
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
    window = construct_window("Delete")
    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == 'Close':
            break
        elif event == "table":
            pass


def get_record():
    window = construct_window("Get Record")
    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == 'Close':
            break
        elif event == "table":
            pass


if __name__ == "__main__":
    main()
