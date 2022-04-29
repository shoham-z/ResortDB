-- all the names of male customers less than 30 yo
SELECT customer_name, age, room_number
FROM Customer C NATURAL JOIN RoomOrder O
WHERE age < 30 and isMale = 1;

-- all the empty rooms
SELECT room_id
FROM Room R
WHERE NOT EXISTS (SELECT room_id FROM RoomOrder O
                    WHERE R.room_id = O.room_number);

-- all the maintenance emps who have no rooms assigned
SELECT emp_name
FROM MaintenanceEmp ME
WHERE NOT EXISTS(SELECT emp_id FROM Maintain M WHERE ME.emp_id != M.emp_id);

SELECT emp_name
FROM MaintenanceEmp ME
WHERE emp_id NOT IN (SELECT emp_id FROM MaintenanceEmp NATURAL JOIN Maintain);