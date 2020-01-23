require 'pg'
task :setup do
  connection = PG.connect
  connection.exec('CREATE DATABASE MakersBnB;')
  connection.exec('CREATE DATABASE MakersBnB_test;')
  connection = PG.connect :dbname => 'MakersBnB';
  connection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(50), email VARCHAR(50) UNIQUE NOT NULL, password VARCHAR(50) NOT NULL);')
  connection.exec('CREATE TABLE space (id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL, description VARCHAR(100), price INT NOT NULL, available_from DATE NOT NULL, available_to DATE NOT NULL, user_id INTEGER REFERENCES users (id) );')
  connection = PG.connect :dbname => 'MakersBnb_test';
  connection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(50), email VARCHAR(50) UNIQUE NOT NULL, password VARCHAR(50) NOT NULL);')
  connection.exec('CREATE TABLE space (id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL, description VARCHAR(100), price INT NOT NULL, available_from DATE NOT NULL, available_to DATE NOT NULL, user_id INTEGER REFERENCES users (id) );')
end
