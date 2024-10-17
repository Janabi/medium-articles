-- Create the database
CREATE DATABASE "john-shop";

-- Connect to the newly created database
\c john-shop;

-- Create owner table
CREATE TABLE IF NOT EXISTS owner (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    year_of_birth INT NOT NULL
);

-- Insert dummy data into owner table
INSERT INTO owner (full_name, year_of_birth) VALUES
('John Doe', 1980),
('Jane Smith', 1975),
('Alice Johnson', 1990),
('Bob Brown', 1985),
('Charlie Davis', 1978),
('David Wilson', 1982),
('Emma Moore', 1992),
('Frank Taylor', 1988),
('Grace Hall', 1995),
('Hank Thompson', 1970),
('Ivy Harris', 1994),
('Jack White', 1986),
('Kelly Young', 1983),
('Liam King', 1989),
('Mia Scott', 1991);

-- Create car table without owner_id column
CREATE TABLE IF NOT EXISTS car (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    year INT NOT NULL
);

-- Add owner_id column and allow it to be NULL
ALTER TABLE car
ADD COLUMN owner_id INT NULL;

-- Add foreign key constraint on owner_id
ALTER TABLE car
ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owner(id) ON DELETE SET NULL;

-- Insert dummy data into car table without owner_id
INSERT INTO car (name, brand, year) VALUES
('Model S', 'Tesla', 2020),
('Mustang', 'Ford', 2018),
('Civic', 'Honda', 2019),
('Corolla', 'Toyota', 2021),
('Challenger', 'Dodge', 2022),
('Accord', 'Honda', 2017),
('Camry', 'Toyota', 2020),
('F-150', 'Ford', 2019),
('Wrangler', 'Jeep', 2018),
('Escalade', 'Cadillac', 2022);
