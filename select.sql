-- 1. Вибрати всі авіакомпанії:
SELECT * FROM airline;


-- 2. Вибрати всі літаки, що належать певній авіакомпанії:
SELECT * FROM aircraft WHERE airline_id = 1;

-- 3. Вибрати всі аеропорти в певному місті:
SELECT * FROM airport WHERE location = 'City X';

-- 4. Вибрати всі рейси, які вилітають з певного аеропорту:
SELECT * FROM flight WHERE dep_airport_id = 1;

-- 5. Вибрати всі рейси, які прибувають в певний аеропорт:
SELECT * FROM flight WHERE arr_airport_id = 2;

-- 6. Вибрати всі рейси, що використовують певний літак:
SELECT * FROM flight WHERE aircraft_id = 1;

-- 7. Вибрати всі бронювання для певного рейсу:
SELECT * FROM booking WHERE flight_id = 1;

-- 8. Вибрати всі бронювання певного пасажира:
SELECT * FROM booking WHERE passenger_id = 1;

-- 9. Вибрати всі пасажири, які мають бронювання на певний рейс:
SELECT p.* 
FROM passenger p
JOIN booking b ON p.passenger_id = b.passenger_id
WHERE b.flight_id = 1;

-- 10. Вибрати всі рейси певної авіакомпанії:
SELECT f.* 
FROM flight f
JOIN aircraft a ON f.aircraft_id = a.aircraft_id
WHERE a.airline_id = 1;

-- 11. Вибрати всі пасажири з певним прізвищем:
SELECT * FROM passenger WHERE last_name = 'Doe';

-- 12. Вибрати всі рейси, які відбуваються у певну дату:
SELECT * FROM flight WHERE departure_date = '2024-06-01';

-- 13. Вибрати всі бронювання, зроблені у певний день:
SELECT * FROM booking WHERE booking_date = '2024-05-20';

-- 14. Вибрати кількість місць у кожному літаку:
SELECT model, capacity FROM aircraft;

-- 15. Вибрати всі рейси між двома певними аеропортами:
SELECT * FROM flight WHERE dep_airport_id = 1 AND arr_airport_id = 2;
