--  Create the database only if it does not already exist
CREATE DATABASE IF NOT EXISTS Studentmanagement;

--  Select the database for all subsequent SQL operations
USE Studentmanagement;

--  Remove the Students table if already created
DROP TABLE IF EXISTS Students;

--  Create the Students table with proper structure
CREATE TABLE Students(
  studentid INT PRIMARY KEY AUTO_INCREMENT,  -- unique student ID
  name VARCHAR(50),                          -- student name
  gender VARCHAR(1),                         -- gender: M or F
  age INT,                                   -- student age
  academicgrade VARCHAR(10),                 -- overall grade
  MathScore INT,                             -- score in Math
  ScienceScore INT,                          -- score in Science
  EnglishScore INT                           -- score in English
);

--  Insert NEW set of student records
INSERT INTO Students(Name, Gender, Age, AcademicGrade, MathScore, ScienceScore, EnglishScore)
VALUES 
('Riya Mehta',      'F', 15, 'A', 92, 88, 91),
('Tanishq Verma',   'M', 16, 'B', 78, 74, 82),
('Divya Sharma',    'F', 17, 'A', 85, 90, 87),
('Aditya Saxena',   'M', 18, 'C', 65, 69, 72),
('Simran Bhatt',    'F', 16, 'B', 81, 77, 79),
('Vikram Desai',    'M', 15, 'C', 60, 68, 64),
('Sneha Kapoor',    'F', 17, 'A', 89, 94, 90),
('Aarav Bansal',    'M', 18, 'B', 76, 70, 68),
('Farhan Khan',     'M', 15, 'A', 91, 92, 88),
('Ishita Jain',     'F', 16, 'C', 66, 61, 74);

--  Display all records to verify the data
SELECT * FROM Students;

--  Show average scores for each subject across all students
SELECT 
  AVG(MathScore) AS AvgMathScore,
  AVG(ScienceScore) AS AvgScienceScore,
  AVG(EnglishScore) AS AvgEnglishScore
FROM Students;

--  List students with their total score, ordered from highest to lowest
SELECT 
  Name,
  (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC;

--  Count number of students falling under each academic grade
SELECT 
  AcademicGrade,
  COUNT(*) AS StudentCount
FROM Students
GROUP BY AcademicGrade;

--  Calculate average subject scores grouped by gender
SELECT 
  Gender,
  AVG(MathScore) AS AvgMathScore,
  AVG(ScienceScore) AS AvgScienceScore,
  AVG(EnglishScore) AS AvgEnglishScore
FROM Students
GROUP BY Gender;

--  Find students who scored more than 80 in Math
SELECT 
  Name, 
  MathScore
FROM Students
WHERE MathScore > 80;

--  Change the academic grade of student with ID = 3 to A+
UPDATE Students
SET AcademicGrade = 'A+'
WHERE StudentId = 3;

--  Confirm update for student ID = 3
SELECT *
FROM Students
WHERE StudentId = 3;
