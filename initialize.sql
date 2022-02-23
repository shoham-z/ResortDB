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
INSERT INTO Room VALUES (1, 2, 3,4000);
INSERT INTO Room VALUES (2, 4, 3,6000);
INSERT INTO Room VALUES (4, 4, 5,8000);

create table if not exists Client(
  ClientId NUMERIC(9, 0) primary key,
  ClientName varchar(30),
  EntryDate DATE,
  Cost INTEGER
);
INSERT INTO Client VALUES (325913626,'shoham zeharya', '2022-02-03', 2000);
INSERT INTO Client VALUES (325620216,'soham hrya', '2022-02-23', 2000);
INSERT INTO Client VALUES (325362733,'shoham', '2022-01-02', 2000);
INSERT INTO Client VALUES (325363612,'zeharya', '2021-11-23', 2000);

create table Orders AS
    SELECT ClientId, RoomId
    FROM Client AS C, Room
    WHERE C.ClientName =='shoham';



CREATE TABLE if not exists MaintenanceEmp (
    EmpNumber INT NOT NULL,
    EmpName VARCHAR(20) NOT NULL,
    RoomId INTEGER,
    HireDate DATETIME,
    Salary NUMERIC(7,2) NOT NULL,
    UNIQUE (EmpNumber, EmpName),
    FOREIGN KEY (RoomId) REFERENCES Room(RoomId)
);
INSERT INTO MaintenanceEmp VALUES (2314245, 'Shoham',1 , 2020-3-23, 6000);
INSERT INTO MaintenanceEmp VALUES (2314445, 'shoham',2 , 2020-3-23, 6000);
INSERT INTO MaintenanceEmp VALUES (2314345, 'sHoham',3 , 2020-3-23, 6000);
