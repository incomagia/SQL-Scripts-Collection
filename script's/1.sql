-- Создание базы данных
CREATE DATABASE vehicles_db;
USE vehicles_db;

-- Создание таблицы Vehicle
CREATE TABLE Vehicle (
    maker VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    type ENUM('Car', 'Motorcycle', 'Bicycle') NOT NULL,
    PRIMARY KEY (model)
);

-- Создание таблицы Car
CREATE TABLE Car (
    vin VARCHAR(17) NOT NULL,
    model VARCHAR(100) NOT NULL,
    engine_capacity DECIMAL(4, 2) NOT NULL,
    horsepower INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    transmission ENUM('Automatic', 'Manual') NOT NULL,
    PRIMARY KEY (vin),
    FOREIGN KEY (model) REFERENCES Vehicle(model)
);

-- Создание таблицы Motorcycle
CREATE TABLE Motorcycle (
    vin VARCHAR(17) NOT NULL,
    model VARCHAR(100) NOT NULL,
    engine_capacity DECIMAL(4, 2) NOT NULL,
    horsepower INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    type ENUM('Sport', 'Cruiser', 'Touring') NOT NULL,
    PRIMARY KEY (vin),
    FOREIGN KEY (model) REFERENCES Vehicle(model)
);

-- Создание таблицы Bicycle
CREATE TABLE Bicycle (
    serial_number VARCHAR(20) NOT NULL,
    model VARCHAR(100) NOT NULL,
    gear_count INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    type ENUM('Mountain', 'Road', 'Hybrid') NOT NULL,
    PRIMARY KEY (serial_number),
    FOREIGN KEY (model) REFERENCES Vehicle(model)
);

-- Вставка нужных данных
INSERT INTO Vehicle (maker, model, type) VALUES
('Yamaha', 'YZF-R1', 'Motorcycle'),
('Kawasaki', 'Ninja', 'Motorcycle');

INSERT INTO Motorcycle (vin, model, engine_capacity, horsepower, price, type) VALUES
('JYARN28E9FA123456', 'YZF-R1', 1.0, 200, 17000.00, 'Sport'),
('JKBVNAF156A123456', 'Ninja', 0.9, 150, 14000.00, 'Sport');

-- Задача 1: Найти спортивные мотоциклы мощнее 150 л.с. и дешевле $20000
SELECT Vehicle.maker, Vehicle.model
FROM Vehicle
JOIN Motorcycle ON Vehicle.model = Motorcycle.model
WHERE Motorcycle.horsepower > 150
  AND Motorcycle.price < 20000
  AND Motorcycle.type = 'Sport'
ORDER BY Motorcycle.horsepower DESC;
