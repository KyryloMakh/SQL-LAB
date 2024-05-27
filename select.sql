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

-- Вибрати деталі всіх пасажирів, які забронювали рейс, що відправляється з певного аеропорту:
SELECT DISTINCT p.*
FROM passenger p
INNER JOIN booking b ON p.passenger_id = b.passenger_id
INNER JOIN flight f ON b.flight_id = f.flight_id
WHERE f.dep_airport_id = (SELECT airport_id FROM airport WHERE code = 'DEP_CODE');

-- Знайти загальну кількість бронювань для кожної авіакомпанії:------------------------------------------------
SELECT a.name AS airline_name, COUNT(b.booking_id) AS total_bookings
FROM airline a
LEFT JOIN aircraft ac ON a.airline_id = ac.airline_id
LEFT JOIN flight f ON ac.aircraft_id = f.aircraft_id
LEFT JOIN booking b ON f.flight_id = b.flight_id
GROUP BY a.airline_id;

-- Отримати номери паспортів та контактну інформацію пасажирів, які забронювали рейси, що обслуговуються конкретною авіакомпанією:
SELECT DISTINCT p.passport_number, p.contact_info
FROM passenger p
INNER JOIN booking b ON p.passenger_id = b.passenger_id
INNER JOIN flight f ON b.flight_id = f.flight_id
INNER JOIN aircraft ac ON f.aircraft_id = ac.aircraft_id
INNER JOIN airline a ON ac.airline_id = a.airline_id
WHERE a.name = 'Назва_Авіакомпанії';

-- Вивести всі рейси, які відправляються з та прибувають в один і той самий аеропорт:
SELECT f.flight_number, dep.name AS departure_airport, arr.name AS arrival_airport
FROM flight f
INNER JOIN airport dep ON f.dep_airport_id = dep.airport_id
INNER JOIN airport arr ON f.arr_airport_id = arr.airport_id
WHERE f.dep_airport_id = f.arr_airport_id;

-- Знайти пасажира з найбільшою кількістю бронювань:
SELECT p.passenger_id, p.first_name, p.last_name, COUNT(b.booking_id) AS total_bookings
FROM passenger p
LEFT JOIN booking b ON p.passenger_id = b.passenger_id
GROUP BY p.passenger_id, p.first_name, p.last_name
ORDER BY total_bookings DESC
LIMIT 1;

-- Вибрати деталі всіх пасажирів, які забронювали рейс, що відправляється з певного аеропорту:
SELECT DISTINCT p.*
FROM passenger p
INNER JOIN booking b ON p.passenger_id = b.passenger_id
INNER JOIN flight f ON b.flight_id = f.flight_id
WHERE f.dep_airport_id = (SELECT airport_id FROM airport WHERE code = 'DEP_CODE');

-- Знайти загальну кількість бронювань для кожної авіакомпанії:---------------------------------
SELECT a.name AS airline_name, COUNT(b.booking_id) AS total_bookings
FROM airline a
LEFT JOIN aircraft ac ON a.airline_id = ac.airline_id
LEFT JOIN flight f ON ac.aircraft_id = f.aircraft_id
LEFT JOIN booking b ON f.flight_id = b.flight_id
GROUP BY a.airline_id;

-- Отримати номери паспортів та контактну інформацію пасажирів, які забронювали рейси, що обслуговуються конкретною авіакомпанією:
SELECT DISTINCT p.passport_number, p.contact_info
FROM passenger p
INNER JOIN booking b ON p.passenger_id = b.passenger_id
INNER JOIN flight f ON b.flight_id = f.flight_id
INNER JOIN aircraft ac ON f.aircraft_id = ac.aircraft_id
INNER JOIN airline a ON ac.airline_id = a.airline_id
WHERE a.name = 'Назва_Авіакомпанії';

-- Вивести всі рейси, які відправляються з та прибувають в один і той самий аеропорт:
SELECT f.flight_number, dep.name AS departure_airport, arr.name AS arrival_airport
FROM flight f
INNER JOIN airport dep ON f.dep_airport_id = dep.airport_id
INNER JOIN airport arr ON f.arr_airport_id = arr.airport_id
WHERE f.dep_airport_id = f.arr_airport_id;

-- Знайти пасажира з найбільшою кількістю бронювань:
SELECT p.passenger_id, p.first_name, p.last_name, COUNT(b.booking_id) AS total_bookings
FROM passenger p
LEFT JOIN booking b ON p.passenger_id = b.passenger_id
GROUP BY p.passenger_id, p.first_name, p.last_name
ORDER BY total_bookings DESC
LIMIT 1;

-- Вивести всі рейси, де виліт і приліт відбуваються в різних країнах
SELECT 
    f.flight_id, 
    f.flight_number, 
    f.departure_date, 
    f.departure_time, 
    f.arrival_date, 
    f.arrival_time, 
    a.model AS aircraft_model, 
    dep_airport.name AS departure_airport, 
    arr_airport.name AS arrival_airport, 
    airline.name AS airline_name
FROM 
    flight f
JOIN 
    aircraft a ON f.aircraft_id = a.aircraft_id
JOIN 
    airport dep_airport ON f.dep_airport_id = dep_airport.airport_id
JOIN 
    airport arr_airport ON f.arr_airport_id = arr_airport.airport_id
JOIN 
    airline ON a.airline_id = airline.airline_id
WHERE 
    airline.name = 'Delta Air Lines'
    AND a.manufacturer = 'Boeing';