CREATE DATABASE kursova1;
USE kursova1;

CREATE TABLE airline (
    airline_id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    code VARCHAR(10)
);

CREATE TABLE aircraft (
    aircraft_id INTEGER PRIMARY KEY,
    model VARCHAR(100),
    manufacturer VARCHAR(100),
    capacity INTEGER,
    airline_id INTEGER
);

CREATE TABLE airport (
    airport_id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    code VARCHAR(10),
    location VARCHAR(100)
);

CREATE TABLE flight (
    flight_id INTEGER PRIMARY KEY,
    flight_number INTEGER,
    departure_date DATE,
    departure_time TIME,
    arrival_date DATE,
    arrival_time TIME,
    aircraft_id INTEGER,
    dep_airport_id INTEGER,
    arr_airport_id INTEGER
);

CREATE TABLE passenger (
    passenger_id INTEGER PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    passport_number VARCHAR(20),
    contact_info VARCHAR(100)
);

CREATE TABLE booking (
    booking_id INTEGER PRIMARY KEY,
    booking_date DATE,
    passenger_id INTEGER,
    flight_id INTEGER,
    seat VARCHAR(10)
);

-- Додавання зовнішніх ключів за допомогою ALTER TABLE
ALTER TABLE aircraft
ADD CONSTRAINT fk_airline_id
FOREIGN KEY (airline_id) REFERENCES airline(airline_id);

ALTER TABLE flight
ADD CONSTRAINT fk_aircraft_id
FOREIGN KEY (aircraft_id) REFERENCES aircraft(aircraft_id);

ALTER TABLE flight
ADD CONSTRAINT fk_dep_airport_id
FOREIGN KEY (dep_airport_id) REFERENCES airport(airport_id);

ALTER TABLE flight
ADD CONSTRAINT fk_arr_airport_id
FOREIGN KEY (arr_airport_id) REFERENCES airport(airport_id);

ALTER TABLE booking
ADD CONSTRAINT fk_passenger_id
FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id);

ALTER TABLE booking
ADD CONSTRAINT fk_flight_id
FOREIGN KEY (flight_id) REFERENCES flight(flight_id);
