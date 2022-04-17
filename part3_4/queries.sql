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