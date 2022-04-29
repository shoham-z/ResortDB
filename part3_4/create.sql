create table Room(
    room_id INT NOT NULL PRIMARY KEY,
    name varchar(30),
    max_people INT NOT NULL,
    price INT NOT NULL
);

create table Customer(
  customer_id INT,
  customer_name varchar(30),
  age INT,
  isMale BIT NOT NULL,
    constraint PRIMARY KEY (customer_id)
);

CREATE TABLE Employee(
    id INT,
    name varchar(30),
    age INT,
    isMale BIT NOT NULL,
    role VARCHAR(20),
    bankAccount VARCHAR(20),
    salary INT NOT NULL,
    constraint PRIMARY KEY (id)
);

CREATE TABLE RoomOrder(
    OrderId INT,
    amount INT,
    room_number INT,
    customer_id INT,
    constraint PRIMARY KEY (OrderId),
    CONSTRAINT FOREIGN KEY (room_number) REFERENCES Room(room_id) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE Maintain(
    room_id INT,
    emp_id INT,
    CONSTRAINT FOREIGN KEY (room_id)
        REFERENCES Room(room_id)
        ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (emp_id) REFERENCES Employee(id) ON DELETE CASCADE
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
    order_id     INT(4)      NOT NULL,
    prod_name    VARCHAR(30) NOT NULL,
    amount       INT(2)      NOT NULL,
    suppliers_id INT(4)      NOT NULL,
    priority     INT(1)      NOT NULL,
    CONSTRAINT PRIMARY KEY (prod_name, order_id)
);

CREATE TABLE dish_prices(
    dish_name VARCHAR(30) NOT NULL ,
    price FLOAT(1) NOT NULL ,
    rating INT (1) NOT NULL ,
    CONSTRAINT PRIMARY KEY (dish_name)
);

CREATE TABLE dish_details(
    dish_name VARCHAR(30) NOT NULL,
    prod_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (dish_name, prod_name),
    CONSTRAINT FOREIGN KEY (dish_name) REFERENCES dish_prices(dish_name) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (prod_name) REFERENCES suppliers_orders(prod_name) ON DELETE CASCADE
);

CREATE TABLE ingredients(
    prod_name VARCHAR(30) NOT NULL,
    amount    INT(2)      NOT NULL,
    allergen  VARCHAR(30) DEFAULT NULL,
    vegan     BOOLEAN     NOT NULL,
    CONSTRAINT PRIMARY KEY (prod_name),
    CONSTRAINT FOREIGN KEY (prod_name) REFERENCES suppliers_orders(prod_name) ON DELETE CASCADE
);

