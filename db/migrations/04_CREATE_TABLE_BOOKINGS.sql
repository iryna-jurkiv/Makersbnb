CREATE TABLE bookings (
  space_id INTEGER REFERENCES space(id),
  id SERIAL PRIMARY KEY,
  owner INTEGER,
  renter INTEGER REFERENCES users(id),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  booking_status VARCHAR(12) DEFAULT 'reserved'
);
