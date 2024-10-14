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

-- Create car table
CREATE TABLE IF NOT EXISTS car (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    year INT NOT NULL,
    owner_id INT,
    CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owner(id) ON DELETE SET NULL
);

-- Insert dummy data into car table
INSERT INTO car (name, brand, year, owner_id) VALUES
('Model S', 'Tesla', 2020, 1),
('Mustang', 'Ford', 2018, 2),
('Civic', 'Honda', 2019, 3),
('Corolla', 'Toyota', 2021, 4),
('Challenger', 'Dodge', 2022, 5),
('Accord', 'Honda', 2017, 6),
('Camry', 'Toyota', 2020, NULL),
('F-150', 'Ford', 2019, 1),
('Wrangler', 'Jeep', 2018, 6),
('Escalade', 'Cadillac', 2022, 7);
