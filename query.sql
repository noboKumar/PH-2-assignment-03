-- users table
CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    role NOT NULL DEFAULT 'customer' CHECK (role IN ('admin', 'customer')),
    user_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    CHECK (email = lower(email)),
    password text NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- vehicle table
CREATE TABLE IF NOT EXISTS vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    vehicle_name VARCHAR(50) NOT NULL,
    vehicle_type VARCHAR(50) NOT NULL CHECK (
        vehicle_type IN ('car', 'bike', 'truck')
    ),
    model INT NOT NULL,
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

-- bookings table
CREATE TABLE IF NOT EXISTS bookings (
    booking_id SERIAL PRIMARY KEY,
    booked_user_id INT REFERENCES users (user_id) ON DELETE CASCADE,
    booked_vehicle_id INT REFERENCES vehicles (vehicle_id) ON DELETE CASCADE,
    start_date DATE,
    end_date DATE,
    booking_status VARCHAR(20) NOT NULL CHECK (
        booking_status IN (
            'pending',
            'confirmed',
            'completed',
            'cancelled'
        )
    ),
    total_price NUMERIC(10, 2) NOT NULL
);

-- booking information with customer name and vehicle name
select
    booking_id,
    user_name as customer_name,
    vehicle_name,
    start_date,
    end_date,
    booking_status as status
from
    bookings as b
    join users as u on b.booked_user_id = u.user_id
    join vehicles as v on b.booked_vehicle_id = v.vehicle_id

-- Find all vehicles that have never been booked.
select *
from vehicles as v
where
    NOT EXISTS (
        select booked_vehicle_id
        from bookings as b
        where
            v.vehicle_id = booked_vehicle_id
    )