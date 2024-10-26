-- Active: 1729142840375@@127.0.0.1@5432@university_db

-- creating db
CREATE DATABASE university_db

-- student table creation
CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	student_name VARCHAR(100) NOT NULL,
	age INT NOT NULL,
	email VARCHAR(100) NOT NULL,
	frontend_mark INT,
	backend_mark INT,
	status VARCHAR(10)
)



SELECT * FROM students