CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    role NOT NULL DEFAULT 'customer' CHECK (role IN ('admin', 'customer')),
    user_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    CHECK (email = lower(email)),
    password text NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    vehicle_name VARCHAR(50) NOT NULL,
    registration_number VARCHAR(50) UNIQUE NOT NULL,
    daily_rent_price INT NOT NULL,
    availability_status VARCHAR(20) NOT NULL DEFAULT 'available' CHECK (
        availability_status IN (
            'available',
            'rented',
            'maintenance'
        )
    )
);