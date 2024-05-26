-- Наповнення таблиці airline
INSERT INTO airline (airline_id, name, code) VALUES
(1, 'Airline A', 'AA'),
(2, 'Airline B', 'AB'),
(3, 'Airline C', 'AC'),
(4, 'Airline D', 'AD'),
(5, 'Airline E', 'AE'),
(6, 'Airline F', 'AF'),
(7, 'Airline G', 'AG'),
(8, 'Airline H', 'AH'),
(9, 'Airline I', 'AI');

-- Наповнення таблиці aircraft
INSERT INTO aircraft (aircraft_id, model, manufacturer, capacity, airline_id) VALUES
(1, 'Boeing 737', 'Boeing', 200, 1),
(2, 'Airbus A320', 'Airbus', 180, 2),
(3, 'Boeing 777', 'Boeing', 300, 3),
(4, 'Boeing 787', 'Boeing', 250, 4),
(5, 'Airbus A380', 'Airbus', 500, 5),
(6, 'Boeing 767', 'Boeing', 210, 6),
(7, 'Airbus A350', 'Airbus', 280, 7),
(8, 'Boeing 747', 'Boeing', 400, 8),
(9, 'Airbus A330', 'Airbus', 290, 9);

-- Наповнення таблиці airport
INSERT INTO airport (airport_id, name, code, location) VALUES
(1, 'Airport X', 'AX', 'City X'),
(2, 'Airport Y', 'AY', 'City Y'),
(3, 'Airport Z', 'AZ', 'City Z'),
(4, 'Airport W', 'AW', 'City W'),
(5, 'Airport V', 'AV', 'City V'),
(6, 'Airport U', 'AU', 'City U'),
(7, 'Airport T', 'AT', 'City T'),
(8, 'Airport S', 'AS', 'City S'),
(9, 'Airport R', 'AR', 'City R');

-- Наповнення таблиці flight
INSERT INTO flight (flight_id, flight_number, departure_date, departure_time, arrival_date, arrival_time, aircraft_id, dep_airport_id, arr_airport_id) VALUES
(1, 1001, '2024-06-01', '08:00:00', '2024-06-01', '10:00:00', 1, 1, 2),
(2, 1002, '2024-06-02', '09:00:00', '2024-06-02', '11:30:00', 2, 2, 3),
(3, 1003, '2024-06-03', '07:30:00', '2024-06-03', '09:45:00', 3, 3, 1),
(4, 1004, '2024-06-04', '10:00:00', '2024-06-04', '12:00:00', 4, 4, 5),
(5, 1005, '2024-06-05', '11:00:00', '2024-06-05', '13:30:00', 5, 5, 6),
(6, 1006, '2024-06-06', '12:30:00', '2024-06-06', '15:00:00', 6, 6, 7),
(7, 1007, '2024-06-07', '13:00:00', '2024-06-07', '15:30:00', 7, 7, 8),
(8, 1008, '2024-06-08', '14:00:00', '2024-06-08', '16:30:00', 8, 8, 9),
(9, 1009, '2024-06-09', '15:00:00', '2024-06-09', '17:00:00', 9, 9, 1);

-- Наповнення таблиці passenger
INSERT INTO passenger (passenger_id, first_name, last_name, passport_number, contact_info) VALUES
(1, 'John', 'Doe', 'A12345678', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'B87654321', 'jane.smith@example.com'),
(3, 'Alice', 'Johnson', 'C13579246', 'alice.johnson@example.com'),
(4, 'Bob', 'Brown', 'D24681357', 'bob.brown@example.com'),
(5, 'Charlie', 'Davis', 'E11223344', 'charlie.davis@example.com'),
(6, 'Dana', 'White', 'F22334455', 'dana.white@example.com'),
(7, 'Eve', 'Miller', 'G33445566', 'eve.miller@example.com'),
(8, 'Frank', 'Wilson', 'H44556677', 'frank.wilson@example.com'),
(9, 'Grace', 'Moore', 'I55667788', 'grace.moore@example.com');

-- Наповнення таблиці booking
INSERT INTO booking (booking_id, booking_date, passenger_id, flight_id, seat) VALUES
(1, '2024-05-20', 1, 1, '12A'),
(2, '2024-05-21', 2, 2, '15B'),
(3, '2024-05-22', 3, 3, '18C'),
(4, '2024-05-23', 4, 4, '19D'),
(5, '2024-05-24', 5, 5, '20E'),
(6, '2024-05-25', 6, 6, '21F'),
(7, '2024-05-26', 7, 7, '22G'),
(8, '2024-05-27', 8, 8, '23H'),
(9, '2024-05-28', 9, 9, '24I'),
(10, '2024-05-29', 1, 4, '25J'),
(11, '2024-05-30', 2, 5, '26K'),
(12, '2024-06-01', 3, 6, '27L'),
(13, '2024-06-02', 4, 7, '28M'),
(14, '2024-06-03', 5, 8, '29N'),
(15, '2024-06-04', 6, 9, '30O'),
(16, '2024-06-05', 7, 1, '31P'),
(17, '2024-06-06', 8, 2, '32Q'),
(18, '2024-06-07', 9, 3, '33R'),
(19, '2024-06-08', 1, 5, '34S'),
(20, '2024-06-09', 2, 6, '35T'),
(21, '2024-06-10', 3, 7, '36U'),
(22, '2024-06-11', 4, 8, '37V'),
(23, '2024-06-12', 5, 9, '38W'),
(24, '2024-06-13', 6, 1, '39X'),
(25, '2024-06-14', 7, 2, '40Y'),
(26, '2024-06-15', 8, 3, '41Z'),
(27, '2024-06-16', 9, 4, '42A');
