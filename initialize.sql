drop table Room;
drop table MaintenanceEmp;
drop table Orders;
drop table Client;

create table if not exists Room(
    room_id INTEGER NOT NULL PRIMARY KEY,
    num_windows INTEGER NOT NULL,
    max_people INTEGER NOT NULL,
    price INTEGER NOT NULL
);

create table if not exists Client(
  client_id NUMERIC(9, 0) primary key,
  client_name varchar(30)
);

create table if not exists Orders(
    client_id INTEGER,
    room_id INTEGER,
    order_price INTEGER,
    entry_date DATE NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Client(client_id)
);


CREATE TABLE if not exists MaintenanceEmp (
    emp_number INT NOT NULL,
    emp_name VARCHAR(20) NOT NULL,
    room_id INTEGER,
    hire_date DATETIME,
    salary NUMERIC(7,2) NOT NULL,
    UNIQUE (emp_number, emp_name),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);
