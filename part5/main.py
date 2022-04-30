import PySimpleGUI as sg
import check_in_db as db


def start():
    sg.theme('DarkAmber')
    layout = [[sg.Text(text="TableName"), sg.Input(key='-TABLE-'), sg.Button(button_text="Submit", enable_events=True, key="table")]]

    window = sg.Window('Mini Project Data-Bases', layout)

    event, values = window.read()
    if event in (None, 'Cancel'):
        pass
    elif event == "table":
        if db.is_table(str(values['-TABLE-'])):
            window.extend_layout(window, [[sg.Text(text="Column(s) name"), sg.Input(key='-ATTRIBUTES-'),
                                           sg.Button(button_text="Submit", enable_events=True, key="att")]])
            while True:
                event, values = window.read()
                if event == "att":
                    break
            print(values['-ATTRIBUTES-'])
            if db.are_attributes(str(values['-TABLE-']), str(values['-ATTRIBUTES-'])):
                pass
        else:
            window.extend_layout(window, [[sg.Text('Table does not exist')]])

    window.extend_layout(window, [[sg.Button(button_text="Close")]])

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == 'Close':
            break
    window.close()


def table_exists(window: sg.Window):
    window.extend_layout(window, [[sg.Input(default_text="Column(s) name", key='-ATRIBBUTES-'), sg.Button(button_text="Submit", enable_events=True)]])


if __name__ == "__main__":
    start()
