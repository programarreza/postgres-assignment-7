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


-- courses table creation 
CREATE TABLE courses(
	course_id SERIAL PRIMARY KEY,
	course_name VARCHAR(100) NOT NULL,
	credits INT NOT NULL
)

-- enrolment table creation
CREATE TABLE enrollment(
	enrollment_id SERIAL PRIMARY KEY,
	student_id INT REFERENCES students (student_id) NOT NULL,
	course_id INT REFERENCES courses (course_id) NOT NULL
)


SELECT * FROM enrollment