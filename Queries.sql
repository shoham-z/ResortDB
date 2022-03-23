create table if not exists Room(
    room_id INT NOT NULL PRIMARY KEY,
    name varchar(30),
    max_people INT NOT NULL,
    price INT NOT NULL
);
create table Customer(
  client_id INT,
  client_name varchar(30),
  age INT,
  isMale BIT NOT NULL,
    constraint id_key PRIMARY KEY (client_id)
);
CREATE TABLE MaintenanceEmp (
    emp_id INT,
    emp_name varchar(30),
    age INT,
    isMale BIT NOT NULL,
    room_id INT,
    salary INT NOT NULL,
    constraint id_key PRIMARY KEY (emp_id),
    CONSTRAINT FOREIGN KEY (room_id) REFERENCES Room(room_id) ON DELETE CASCADE
);
CREATE TABLE RoomOrder(
    OrderId INT,
    amount INT,
    room_id INT,
    customer_id INT,
    constraint id PRIMARY KEY (OrderId),
    CONSTRAINT FOREIGN KEY (room_id) REFERENCES Room(room_id) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (customer_id) REFERENCES Customer(client_id) ON DELETE CASCADE
);
CREATE TABLE Maintane(
    room_id INT,
    emp_id INT,
    CONSTRAINT FOREIGN KEY (room_id)
        REFERENCES Room(room_id)
        ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (emp_id) REFERENCES MaintenanceEmp(emp_id) ON DELETE CASCADE
);


CREATE TABLE oldMales(client_name varchar(30));
INSERT INTO oldMAles SELECT client_name FROM Customer
WHERE Customer.age > 60 and Customer.isMale = 1;

CREATE TABLE emptyRooms(roomId INT);
INSERT INTO emptyRooms SELECT room_id
FROM Room
WHERE NOT EXISTS (SELECT room_id FROM Room);

CREATE TABLE toAssign(emp_id INT);
INSERT INTO toAssign SELECT emp_id
FROM MaintenanceEmp
WHERE NOT EXISTS(SELECT emp_id FROM Maintane);