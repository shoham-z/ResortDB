drop table Room;
drop table MaintenanceEmp;
drop table Orders;
drop table Client;

create table if not exists Room(
    RoomId INTEGER NOT NULL PRIMARY KEY,
    NumWindows INTEGER NOT NULL,
    MaxPeople INTEGER NOT NULL,
    Price INTEGER NOT NULL
);

create table if not exists Client(
  ClientId NUMERIC(9, 0) primary key,
  ClientName varchar(30),
  EntryDate DATE,
  Cost INTEGER
);

create table if not exists Orders(
    client_id INTEGER,
    room_id INTEGER,
    order_price INTEGER,
    FOREIGN KEY (client_id) REFERENCES Client(ClientId),
    FOREIGN KEY (room_id) REFERENCES Room(RoomId)
);



CREATE TABLE if not exists MaintenanceEmp (
    EmpNumber INT NOT NULL,
    EmpName VARCHAR(20) NOT NULL,
    RoomId INTEGER,
    HireDate DATETIME,
    Salary NUMERIC(7,2) NOT NULL,
    UNIQUE (EmpNumber, EmpName),
    FOREIGN KEY (RoomId) REFERENCES Room(RoomId)
);
