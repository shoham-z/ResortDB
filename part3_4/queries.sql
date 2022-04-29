-- customers that have no dining room order booked currently
SELECT customer_name
FROM (SELECT customer_name, customer_id
      FROM customer) as C
      NATURAL JOIN
     (SELECT customer_id
      FROM roomorder) as RO
WHERE customer_name IN
      (SELECT customer_name
       FROM customer
       WHERE customer_name NOT IN
             (SELECT customer_name
              FROM
                   ((SELECT customer_name, customer_id
                    FROM customer) as C
                       NATURAL JOIN
                   (SELECT customer_name
                    FROM diningroomorder) as DRO)));

-- all the names of female customers less than 30 yo that ordered a dinner
SELECT customer_name, age, room_number
FROM Customer C NATURAL JOIN RoomOrder O
WHERE age < 30 and isMale = 1 and C.customer_name in (SELECT name From diningRoomOrder);

-- all the meals that were not ordered
SELECT room_id
FROM Room R
WHERE NOT EXISTS (SELECT room_id FROM RoomOrder O
                    WHERE R.room_id = O.room_number);


-- all the ingredients that are in low stock and used in 4.5+ star meals
SELECT prod_name
FROM ingredients I NATURAL JOIN dish_details DD NATURAL JOIN dish_prices DP
where rating > 4.5 and amount < 10 and prodname NOT IN (SELECT prod_name FROM suppliers_orders);