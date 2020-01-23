CREATE TABLE bookings (
  space_id int REFERENCES space(id),
  id SERIAL PRIMARY KEY,
  owner int REFERENCES users(id),
  renter int REFERENCES users(id),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  booking_status VARCHAR(12) DEFAULT 'reserved'
);
