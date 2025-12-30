CREATE Table IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    role VARCHAR(10) NOT NULL DEFAULT 'customer' CHECK (role IN ('admin', 'customer')),
    user_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    CHECK (email = lower(email)),
    password text NOT NULL,
    phone VARCHAR(20) NOT NULL
);