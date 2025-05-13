/**
 * SQL script to initialize the database schema for the parking management system.
 */
CREATE TABLE parking_lot (
                             id SERIAL PRIMARY KEY,
                             name VARCHAR(100) NOT NULL,
                             address VARCHAR(255) NOT NULL,
                             capacity INTEGER NOT NULL
);

CREATE TABLE parking_space (
                               id SERIAL PRIMARY KEY,
                               parking_lot_id INTEGER REFERENCES parking_lot(id),
                               space_number VARCHAR(10) NOT NULL,
                               type VARCHAR(20) NOT NULL
);

CREATE TABLE client (
                        id SERIAL PRIMARY KEY,
                        name VARCHAR(100) NOT NULL,
                        phone VARCHAR(20),
                        email VARCHAR(100)
);

CREATE TABLE vehicle (
                         id SERIAL PRIMARY KEY,
                         client_id INTEGER REFERENCES client(id),
                         license_plate VARCHAR(20) NOT NULL,
                         brand VARCHAR(50),
                         model VARCHAR(50)
);

CREATE TABLE parking_record (
                                id SERIAL PRIMARY KEY,
                                parking_space_id INTEGER REFERENCES parking_space(id),
                                vehicle_id INTEGER REFERENCES vehicle(id),
                                client_id INTEGER REFERENCES client(id),
                                entry_time TIMESTAMP NOT NULL,
                                exit_time TIMESTAMP
);