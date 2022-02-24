--selecting the clients that got in between 2021-11-28 and 2021-12-5
select client_name
from Client NATURAL JOIN Orders
where entry_date >= '2021-11-28' and entry_date <= '2021-12-23'
