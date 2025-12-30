# Vehicle Rental System

## Overview
The Vehicle Rental System is a simplified database management application designed to handle vehicle bookings efficiently. This project demonstrates database design principles, SQL queries, and relationships between entities like Users, Vehicles, and Bookings. The system supports common business scenarios, such as tracking vehicle availability, booking status, and rental costs.

## Objectives
By completing this project, you will learn to:

- Design an Entity Relationship Diagram (ERD) with 1:1, 1:N, and N:1 relationships.
- Implement primary keys (PK) and foreign keys (FK) in a relational database.
- Write SQL queries using JOIN, EXISTS, WHERE, GROUP BY, and HAVING clauses.
- Apply real-world business logic in database operations.

## Database Design

### Entities & Attributes

#### Users
- `user_id` (Primary Key)
- `role` (Admin / Customer)
- `name`
- `email` (Unique)
- `password`
- `phone_number`

#### Vehicles
- `vehicle_id` (Primary Key)
- `vehicle_name`
- `type` (car / bike / truck)
- `model`
- `registration_number` (Unique)
- `daily_rent_price`
- `availability_status` (available / rented / maintenance)

#### Bookings
- `booking_id` (Primary Key)
- `user_id` (Foreign Key → Users.user_id)
- `vehicle_id` (Foreign Key → Vehicles.vehicle_id)
- `start_date`
- `end_date`
- `booking_status` (pending / confirmed / completed / cancelled)
- `total_cost`

### Relationships
- **One-to-Many (1:N)**: One user can have many bookings.
- **Many-to-One (N:1)**: Many bookings can refer to one vehicle.
- **One-to-One (Logical)**: Each booking connects exactly one user and one vehicle.

### ERD
**DrawSQL:**  
[View on DrawSQL](https://drawsql.app/teams/next-level-dev/diagrams/vehicle-rental-system)  