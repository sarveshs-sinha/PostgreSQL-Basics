-- Table 1

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);

INSERT INTO students (student_name)
VALUES
('Rahul'),
('Amit'),
('Priya');

SELECT * FROM students;

-- Table 2

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);

INSERT INTO courses (course_name)
VALUES
('PostgreSQL'),
('Java'),
('Python');

SELECT * FROM courses;

-- Table 3 i.e. Junction Table that connects two tables

CREATE TABLE student_courses (
    student_id INT,
    course_id INT,

    PRIMARY KEY (student_id, course_id),

    FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);

INSERT INTO student_courses (student_id, course_id)
VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1),
(3, 3);

SELECT * FROM student_courses;

-- Checking Querry

SELECT
    students.student_name,
    courses.course_name
FROM student_courses
JOIN students
    ON student_courses.student_id = students.student_id
JOIN courses
    ON student_courses.course_id = courses.course_id;