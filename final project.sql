
CREATE DATABASE UniversityDB;

USE UniversityDB;


CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    BirthDate DATE,
    EnrollmentDate DATE NOT NULL
);


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    Credits INT NOT NULL,
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);


CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DepartmentID INT NOT NULL,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);


CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (StudentID)
        REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Courses(CourseID)
);


SHOW TABLES;
+------------------------+
| Tables_in_universitydb |
+------------------------+
| courses                |
| departments            |
| enrollments            |
| instructors            |
| students               |
+------------------------+


INSERT INTO Departments
(DepartmentID, DepartmentName)
VALUES
(1, 'Computer Science'),
(2, 'Mathematics');


SELECT * FROM Departments;
+--------------+------------------+
| DepartmentID | DepartmentName   |
+--------------+------------------+
|            1 | Computer Science |
|            2 | Mathematics      |
+--------------+------------------+


INSERT INTO Students
(StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
(3, 'Rahul', 'Patel', 'rahul.patel@email.com', '2003-02-10', '2023-01-15'),
(4, 'Priya', 'Shah', 'priya.shah@email.com', '2002-07-20', '2023-08-01'),
(5, 'Amit', 'Mehta', 'amit.mehta@email.com', '2001-11-05', '2024-01-10'),
(6, 'Neha', 'Desai', 'neha.desai@email.com', '2003-04-12', '2024-08-01'),
(7, 'Arjun', 'Joshi', 'arjun.joshi@email.com', '2002-09-18', '2022-01-10'),
(8, 'Kavya', 'Trivedi', 'kavya.trivedi@email.com', '2004-03-22', '2025-01-05'),
(9, 'Riya', 'Parikh', 'riya.parikh@email.com', '2003-06-14', '2025-08-01'),
(10, 'Dev', 'Thakkar', 'dev.thakkar@email.com', '2001-12-30', '2023-02-01'),
(11, 'Mira', 'Joshi', 'mira.joshi@email.com', '2002-05-19', '2024-02-15'),
(12, 'Karan', 'Rao', 'karan.rao@email.com', '2003-10-08', '2025-02-01');


SELECT StudentID, FirstName, LastName, EnrollmentDate
FROM Students;
+-----------+-----------+----------+----------------+
| StudentID | FirstName | LastName | EnrollmentDate |
+-----------+-----------+----------+----------------+
|         1 | John      | Doe      | 2022-08-01     |
|         2 | Jane      | Smith    | 2021-08-01     |
|         3 | Rahul     | Patel    | 2023-01-15     |
|         4 | Priya     | Shah     | 2023-08-01     |
|         5 | Amit      | Mehta    | 2024-01-10     |
|         6 | Neha      | Desai    | 2024-08-01     |
|         7 | Arjun     | Joshi    | 2022-01-10     |
|         8 | Kavya     | Trivedi  | 2025-01-05     |
|         9 | Riya      | Parikh   | 2025-08-01     |
|        10 | Dev       | Thakkar  | 2023-02-01     |
|        11 | Mira      | Joshi    | 2024-02-15     |
|        12 | Karan     | Rao      | 2025-02-01     |
+-----------+-----------+----------+----------------+


INSERT INTO Courses
(CourseID, CourseName, DepartmentID, Credits)
VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4),
(103, 'Database Management', 1, 3),
(104, 'Calculus', 2, 4),
(105, 'Computer Networks', 1, 3);


SELECT * FROM Courses;
+----------+---------------------+--------------+---------+
| CourseID | CourseName          | DepartmentID | Credits |
+----------+---------------------+--------------+---------+
|      101 | Introduction to SQL |            1 |       3 |
|      102 | Data Structures     |            2 |       4 |
|      103 | Database Management |            1 |       3 |
|      104 | Calculus            |            2 |       4 |
|      105 | Computer Networks   |            1 |       3 |
+----------+---------------------+--------------+---------+


INSERT INTO Instructors
(InstructorID, FirstName, LastName, Email, DepartmentID, Salary)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 75000),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 68000),
(3, 'Sara', 'Patel', 'sara.patel@univ.com', 1, 82000),
(4, 'David', 'Shah', 'david.shah@univ.com', 2, 72000);



SELECT * FROM Instructors;
+--------------+-----------+----------+------------------------+--------------+----------+
| InstructorID | FirstName | LastName | Email                  | DepartmentID | Salary   |
+--------------+-----------+----------+------------------------+--------------+----------+
|            1 | Alice     | Johnson  | alice.johnson@univ.com |            1 | 75000.00 |
|            2 | Bob       | Lee      | bob.lee@univ.com       |            2 | 68000.00 |
|            3 | Sara      | Patel    | sara.patel@univ.com    |            1 | 82000.00 |
|            4 | David     | Shah     | david.shah@univ.com    |            2 | 72000.00 |
+--------------+-----------+----------+------------------------+--------------+----------+



INSERT INTO Enrollments
(EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01'),
(3, 3, 101, '2023-01-15'),
(4, 3, 102, '2023-01-20'),
(5, 4, 101, '2023-08-01'),
(6, 4, 102, '2023-08-05'),
(7, 5, 101, '2024-01-10'),
(8, 5, 102, '2024-01-15'),
(9, 6, 101, '2024-08-01'),
(10, 7, 101, '2022-01-10'),
(11, 7, 102, '2022-01-15'),
(12, 8, 101, '2025-01-05'),
(13, 9, 101, '2025-08-01'),
(14, 10, 101, '2023-02-01'),
(15, 11, 101, '2024-02-15'),
(16, 12, 101, '2025-02-01'),
(17, 1, 103, '2023-09-01');



SELECT * FROM Enrollments;
+--------------+-----------+----------+----------------+
| EnrollmentID | StudentID | CourseID | EnrollmentDate |
+--------------+-----------+----------+----------------+
|            1 |         1 |      101 | 2022-08-01     |
|            2 |         2 |      102 | 2021-08-01     |
|            3 |         3 |      101 | 2023-01-15     |
|            4 |         3 |      102 | 2023-01-20     |
|            5 |         4 |      101 | 2023-08-01     |
|            6 |         4 |      102 | 2023-08-05     |
|            7 |         5 |      101 | 2024-01-10     |
|            8 |         5 |      102 | 2024-01-15     |
|            9 |         6 |      101 | 2024-08-01     |
|           10 |         7 |      101 | 2022-01-10     |
|           11 |         7 |      102 | 2022-01-15     |
|           12 |         8 |      101 | 2025-01-05     |
|           13 |         9 |      101 | 2025-08-01     |
|           14 |        10 |      101 | 2023-02-01     |
|           15 |        11 |      101 | 2024-02-15     |
|           16 |        12 |      101 | 2025-02-01     |
|           17 |         1 |      103 | 2023-09-01     |
+--------------+-----------+----------+----------------+

 
 
INSERT INTO Students
(StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES
(13, 'Test', 'Student', 'test.student@email.com',
 '2004-01-01', '2025-08-01');

SELECT * FROM Students WHERE StudentID = 13;

 +-----------+-----------+----------+------------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                  | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+------------------------+------------+----------------+
|        13 | Test      | Student  | test.student@email.com | 2004-01-01 | 2025-08-01     |
+-----------+-----------+----------+------------------------+------------+----------------+


SELECT * FROM Courses;
+----------+---------------------+--------------+---------+
| CourseID | CourseName          | DepartmentID | Credits |
+----------+---------------------+--------------+---------+
|      101 | Introduction to SQL |            1 |       3 |
|      102 | Data Structures     |            2 |       4 |
|      103 | Database Management |            1 |       3 |
|      104 | Calculus            |            2 |       4 |
|      105 | Computer Networks   |            1 |       3 |
+


UPDATE Students
SET FirstName = 'Updated'
WHERE StudentID = 13;

SELECT StudentID, FirstName, LastName
FROM Students
WHERE StudentID = 13;
+-----------+-----------+----------+
| StudentID | FirstName | LastName |
+-----------+-----------+----------+
|        13 | Updated   | Student  |
+-----------+-----------+----------+


DELETE FROM Students
WHERE StudentID = 13;

SELECT * FROM Students
WHERE StudentID = 13;



-- Departments: CREATE
INSERT INTO Departments
VALUES (99, 'Test Department');

-- Departments: READ
SELECT * FROM Departments WHERE DepartmentID = 99;

-- Departments: UPDATE
UPDATE Departments
SET DepartmentName = 'Updated Department'
WHERE DepartmentID = 99;

-- Departments: DELETE
DELETE FROM Departments WHERE DepartmentID = 99;


-- Courses: CREATE
INSERT INTO Courses
VALUES (199, 'Test Course', 1, 2);

-- Courses: READ
SELECT * FROM Courses WHERE CourseID = 199;

-- Courses: UPDATE
UPDATE Courses SET Credits = 3 WHERE CourseID = 199;

-- Courses: DELETE
DELETE FROM Courses WHERE CourseID = 199;


-- Instructors: CREATE
INSERT INTO Instructors
VALUES (99, 'Test', 'Teacher', 'test.teacher@univ.com', 1, 50000);

-- Instructors: READ
SELECT * FROM Instructors WHERE InstructorID = 99;

-- Instructors: UPDATE
UPDATE Instructors SET Salary = 55000 WHERE InstructorID = 99;

-- Instructors: DELETE
DELETE FROM Instructors WHERE InstructorID = 99;


-- Enrollments: CREATE
INSERT INTO Enrollments
(StudentID, CourseID, EnrollmentDate)
VALUES (2, 103, '2025-09-01');

SET @test_enrollment_id = LAST_INSERT_ID();

-- Enrollments: READ
SELECT * FROM Enrollments
WHERE EnrollmentID = @test_enrollment_id;

-- Enrollments: UPDATE
UPDATE Enrollments
SET EnrollmentDate = '2025-09-15'
WHERE EnrollmentID = @test_enrollment_id;

-- Enrollments: DELETE
DELETE FROM Enrollments
WHERE EnrollmentID = @test_enrollment_id;



SELECT StudentID, FirstName, LastName, EnrollmentDate
FROM Students
WHERE EnrollmentDate >= '2023-01-01'
ORDER BY EnrollmentDate;
+-----------+-----------+----------+----------------+
| StudentID | FirstName | LastName | EnrollmentDate |
+-----------+-----------+----------+----------------+
|         3 | Rahul     | Patel    | 2023-01-15     |
|        10 | Dev       | Thakkar  | 2023-02-01     |
|         4 | Priya     | Shah     | 2023-08-01     |
|         5 | Amit      | Mehta    | 2024-01-10     |
|        11 | Mira      | Joshi    | 2024-02-15     |
|         6 | Neha      | Desai    | 2024-08-01     |
|         8 | Kavya     | Trivedi  | 2025-01-05     |
|        12 | Karan     | Rao      | 2025-02-01     |
|         9 | Riya      | Parikh   | 2025-08-01     |
+-----------+-----------+----------+----------------+


SELECT c.CourseID, c.CourseName, c.Credits
FROM Courses c
JOIN Departments d
ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;
+----------+-----------------+---------+
| CourseID | CourseName      | Credits |
+----------+-----------------+---------+
|      102 | Data Structures |       4 |
|      104 | Calculus        |       4 |
+----------+-----------------+---------+


SELECT c.CourseID, c.CourseName,
       COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(DISTINCT e.StudentID) > 5;
+----------+---------------------+---------------+
| CourseID | CourseName          | TotalStudents |
+----------+---------------------+---------------+
|      101 | Introduction to SQL |            11 |
+----------+---------------------+---------------+


SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN
('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseID) = 2;
+-----------+-----------+----------+
| StudentID | FirstName | LastName |
+-----------+-----------+----------+
|         3 | Rahul     | Patel    |
|         4 | Priya     | Shah     |
|         5 | Amit      | Mehta    |
|         7 | Arjun     | Joshi    |
+-----------+-----------+----------+


SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN
('Introduction to SQL', 'Data Structures')
ORDER BY s.StudentID;
+-----------+-----------+----------+
| StudentID | FirstName | LastName |
+-----------+-----------+----------+
|         1 | John      | Doe      |
|         2 | Jane      | Smith    |
|         3 | Rahul     | Patel    |
|         4 | Priya     | Shah     |
|         5 | Amit      | Mehta    |
|         6 | Neha      | Desai    |
|         7 | Arjun     | Joshi    |
|         8 | Kavya     | Trivedi  |
|         9 | Riya      | Parikh   |
|        10 | Dev       | Thakkar  |
|        11 | Mira      | Joshi    |
|        12 | Karan     | Rao      |
+-----------+-----------+----------+


SELECT AVG(Credits) AS AverageCredits
FROM Courses;
+----------------+
| AverageCredits |
+----------------+
|         3.4000 |
+----------------+


SELECT MAX(i.Salary) AS MaximumSalary
FROM Instructors i
JOIN Departments d ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';
+---------------+
| MaximumSalary |
+---------------+
|      82000.00 |
+---------------+


SELECT d.DepartmentName,
       COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Courses c ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;
+------------------+---------------+
| DepartmentName   | TotalStudents |
+------------------+---------------+
| Computer Science |            11 |
| Mathematics      |             5 |
+------------------+---------------+


SELECT s.StudentID,
       CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
       c.CourseName,
       e.EnrollmentDate
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID
ORDER BY s.StudentID, e.EnrollmentID;
+-----------+---------------+---------------------+----------------+
| StudentID | StudentName   | CourseName          | EnrollmentDate |
+-----------+---------------+---------------------+----------------+
|         1 | John Doe      | Introduction to SQL | 2022-08-01     |
|         1 | John Doe      | Database Management | 2023-09-01     |
|         2 | Jane Smith    | Data Structures     | 2021-08-01     |
|         3 | Rahul Patel   | Introduction to SQL | 2023-01-15     |
|         3 | Rahul Patel   | Data Structures     | 2023-01-20     |
|         4 | Priya Shah    | Introduction to SQL | 2023-08-01     |
|         4 | Priya Shah    | Data Structures     | 2023-08-05     |
|         5 | Amit Mehta    | Introduction to SQL | 2024-01-10     |
|         5 | Amit Mehta    | Data Structures     | 2024-01-15     |
|         6 | Neha Desai    | Introduction to SQL | 2024-08-01     |
|         7 | Arjun Joshi   | Introduction to SQL | 2022-01-10     |
|         7 | Arjun Joshi   | Data Structures     | 2022-01-15     |
|         8 | Kavya Trivedi | Introduction to SQL | 2025-01-05     |
|         9 | Riya Parikh   | Introduction to SQL | 2025-08-01     |
|        10 | Dev Thakkar   | Introduction to SQL | 2023-02-01     |
|        11 | Mira Joshi    | Introduction to SQL | 2024-02-15     |
|        12 | Karan Rao     | Introduction to SQL | 2025-02-01     |
+-----------+---------------+---------------------+----------------+


SELECT s.StudentID,
       CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
       c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID
ORDER BY s.StudentID, e.EnrollmentID;
+-----------+---------------+---------------------+
| StudentID | StudentName   | CourseName          |
+-----------+---------------+---------------------+
|         1 | John Doe      | Introduction to SQL |
|         1 | John Doe      | Database Management |
|         2 | Jane Smith    | Data Structures     |
|         3 | Rahul Patel   | Introduction to SQL |
|         3 | Rahul Patel   | Data Structures     |
|         4 | Priya Shah    | Introduction to SQL |
|         4 | Priya Shah    | Data Structures     |
|         5 | Amit Mehta    | Introduction to SQL |
|         5 | Amit Mehta    | Data Structures     |
|         6 | Neha Desai    | Introduction to SQL |
|         7 | Arjun Joshi   | Introduction to SQL |
|         7 | Arjun Joshi   | Data Structures     |
|         8 | Kavya Trivedi | Introduction to SQL |
|         9 | Riya Parikh   | Introduction to SQL |
|        10 | Dev Thakkar   | Introduction to SQL |
|        11 | Mira Joshi    | Introduction to SQL |
|        12 | Karan Rao     | Introduction to SQL |
+-----------+---------------+---------------------+


SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID IN (
    SELECT CourseID
    FROM Enrollments
    GROUP BY CourseID
    HAVING COUNT(DISTINCT StudentID) > 10
)
ORDER BY s.StudentID;
+-----------+-----------+----------+
| StudentID | FirstName | LastName |
+-----------+-----------+----------+
|         1 | John      | Doe      |
|         3 | Rahul     | Patel    |
|         4 | Priya     | Shah     |
|         5 | Amit      | Mehta    |
|         6 | Neha      | Desai    |
|         7 | Arjun     | Joshi    |
|         8 | Kavya     | Trivedi  |
|         9 | Riya      | Parikh   |
|        10 | Dev       | Thakkar  |
|        11 | Mira      | Joshi    |
|        12 | Karan     | Rao      |
+-----------+-----------+----------+


SELECT StudentID, FirstName, EnrollmentDate,
       YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students
ORDER BY StudentID;
+-----------+-----------+----------------+----------------+
| StudentID | FirstName | EnrollmentDate | EnrollmentYear |
+-----------+-----------+----------------+----------------+
|         1 | John      | 2022-08-01     |           2022 |
|         2 | Jane      | 2021-08-01     |           2021 |
|         3 | Rahul     | 2023-01-15     |           2023 |
|         4 | Priya     | 2023-08-01     |           2023 |
|         5 | Amit      | 2024-01-10     |           2024 |
|         6 | Neha      | 2024-08-01     |           2024 |
|         7 | Arjun     | 2022-01-10     |           2022 |
|         8 | Kavya     | 2025-01-05     |           2025 |
|         9 | Riya      | 2025-08-01     |           2025 |
|        10 | Dev       | 2023-02-01     |           2023 |
|        11 | Mira      | 2024-02-15     |           2024 |
|        12 | Karan     | 2025-02-01     |           2025 |
+-----------+-----------+----------------+----------------+


SELECT InstructorID,
       CONCAT(FirstName, ' ', LastName) AS FullName
FROM Instructors;
+--------------+---------------+
| InstructorID | FullName      |
+--------------+---------------+
|            1 | Alice Johnson |
|            2 | Bob Lee       |
|            3 | Sara Patel    |
|            4 | David Shah    |
+--------------+---------------+


SELECT EnrollmentID, StudentID, CourseID, EnrollmentDate,
       COUNT(*) OVER (
           ORDER BY EnrollmentDate, EnrollmentID
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS RunningTotal
FROM Enrollments
ORDER BY EnrollmentDate, EnrollmentID;
+--------------+-----------+----------+----------------+--------------+
| EnrollmentID | StudentID | CourseID | EnrollmentDate | RunningTotal |
+--------------+-----------+----------+----------------+--------------+
|            2 |         2 |      102 | 2021-08-01     |            1 |
|           10 |         7 |      101 | 2022-01-10     |            2 |
|           11 |         7 |      102 | 2022-01-15     |            3 |
|            1 |         1 |      101 | 2022-08-01     |            4 |
|            3 |         3 |      101 | 2023-01-15     |            5 |
|            4 |         3 |      102 | 2023-01-20     |            6 |
|           14 |        10 |      101 | 2023-02-01     |            7 |
|            5 |         4 |      101 | 2023-08-01     |            8 |
|            6 |         4 |      102 | 2023-08-05     |            9 |
|           17 |         1 |      103 | 2023-09-01     |           10 |
|            7 |         5 |      101 | 2024-01-10     |           11 |
|            8 |         5 |      102 | 2024-01-15     |           12 |
|           15 |        11 |      101 | 2024-02-15     |           13 |
|            9 |         6 |      101 | 2024-08-01     |           14 |
|           12 |         8 |      101 | 2025-01-05     |           15 |
|           16 |        12 |      101 | 2025-02-01     |           16 |
|           13 |         9 |      101 | 2025-08-01     |           17 |
+--------------+-----------+----------+----------------+--------------+


SELECT StudentID, FirstName, LastName, EnrollmentDate,
       CASE
           WHEN EnrollmentDate < DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
           THEN 'Senior'
           ELSE 'Junior'
       END AS StudentLevel
FROM Students
ORDER BY StudentID;
+-----------+-----------+----------+----------------+--------------+
| StudentID | FirstName | LastName | EnrollmentDate | StudentLevel |
+-----------+-----------+----------+----------------+--------------+
|         1 | John      | Doe      | 2022-08-01     | Senior       |
|         2 | Jane      | Smith    | 2021-08-01     | Senior       |
|         3 | Rahul     | Patel    | 2023-01-15     | Junior       |
|         4 | Priya     | Shah     | 2023-08-01     | Junior       |
|         5 | Amit      | Mehta    | 2024-01-10     | Junior       |
|         6 | Neha      | Desai    | 2024-08-01     | Junior       |
|         7 | Arjun     | Joshi    | 2022-01-10     | Senior       |
|         8 | Kavya     | Trivedi  | 2025-01-05     | Junior       |
|         9 | Riya      | Parikh   | 2025-08-01     | Junior       |
|        10 | Dev       | Thakkar  | 2023-02-01     | Junior       |
|        11 | Mira      | Joshi    | 2024-02-15     | Junior       |
|        12 | Karan     | Rao      | 2025-02-01     | Junior       |
+-----------+-----------+----------+----------------+--------------+
