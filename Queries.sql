--selecting the clients that got in between 2021-11-28 and 2021-12-5
CREATE TABLE hannukah(  client_name varchar(30));
INSERT INTO hannukah SELECT client_name
from Customers NATURAL JOIN RoomOrder

