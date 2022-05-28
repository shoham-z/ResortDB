create table Room(
    roomId INT NOT NULL PRIMARY KEY,
    name varchar(30),
    maxPeople INT NOT NULL,
    price INT NOT NULL
);

create table Customer(
  customerId INT,
  customerName varchar(30),
  age INT,
  isMale BIT NOT NULL,
    constraint PRIMARY KEY (customerId)
);

CREATE TABLE Employee(
    id INT,
    name varchar(30),
    age INT,
    isMale BIT NOT NULL,
    role VARCHAR(20),
    bankAccount VARCHAR(20),
    hourlyWage INT NOT NULL,
    hours INT NOT NULL,
    constraint PRIMARY KEY (id)
);

CREATE TABLE RoomOrder(
    OrderId INT,
    amount INT,
    roomNumber INT,
    customerId INT,
    constraint PRIMARY KEY (OrderId),
    CONSTRAINT FOREIGN KEY (roomNumber) REFERENCES Room(roomId) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (customerId) REFERENCES Customer(customerId) ON DELETE CASCADE
);

CREATE TABLE Maintain(
    roomId INT,
    empId INT,
    CONSTRAINT FOREIGN KEY (roomId)
        REFERENCES Room(roomId)
        ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (empId) REFERENCES Employee(id) ON DELETE CASCADE
);

CREATE TABLE diningRoomOrder(
  orderNum INT(4) NOT NULL ,
  name VARCHAR(30) NOT NULL ,
  orderTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  tableNum INT(1) NOT NULL ,
  dinersNum INT(1) NOT NULL ,
  mealTime DATETIME NOT NULL ,
  vegan BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT PRIMARY KEY (orderNum)
);

CREATE TABLE suppliers_orders(
    orderId     INT(4)      NOT NULL,
    prodName    VARCHAR(30) NOT NULL,
    amount       INT(2)      NOT NULL,
    suppliersId INT(4)      NOT NULL,
    priority     INT(1)      NOT NULL,
    CONSTRAINT PRIMARY KEY (prodName, orderId)
);

CREATE TABLE dish_prices(
    dishName VARCHAR(30) NOT NULL ,
    price FLOAT(1) NOT NULL ,
    rating INT (1) NOT NULL ,
    CONSTRAINT PRIMARY KEY (dishName)
);

CREATE TABLE dish_details(
    dishName VARCHAR(30) NOT NULL,
    prodName VARCHAR(30) NOT NULL,
    PRIMARY KEY (dishName, prodName),
    CONSTRAINT FOREIGN KEY (dishName) REFERENCES dish_prices(dishName) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (prodName) REFERENCES suppliers_orders(prodName) ON DELETE CASCADE
);

CREATE TABLE ingredients(
    prodName VARCHAR(30) NOT NULL,
    amount    INT(2)      NOT NULL,
    allergen  VARCHAR(30) DEFAULT NULL,
    vegan     BOOLEAN     NOT NULL,
    CONSTRAINT PRIMARY KEY (prodName),
    CONSTRAINT FOREIGN KEY (prodName) REFERENCES suppliers_orders(prodName) ON DELETE CASCADE
);

