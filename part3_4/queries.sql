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