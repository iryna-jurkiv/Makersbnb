CREATE TABLE space (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(100),
  price INT NOT NULL,
  available_from DATE NOT NULL,
  available_to DATE NOT NULL,
  user_id INTEGER REFERENCES users (id)
);
