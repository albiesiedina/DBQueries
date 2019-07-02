USE SIS -- Database that was used for queries --

--Basic Select--

SELECT * FROM AcademicStatus

--Condition Select--

SELECT number, academicStatusCode
FROM Student
WHERE academicStatusCode = 'D'
ORDER BY number DESC

--

SELECT number, academicStatusCode
FROM Student
WHERE academicStatusCode = 'D'
	  OR academicStatusCode = 'S'
ORDER BY number 

--

SELECT number, academicStatusCode
FROM Student
WHERE NOT academicStatusCode = 'N'
ORDER BY number

--

SELECT number, academicStatusCode
FROM Student
WHERE academicStatusCode != 'N'
ORDER BY number ASC

--Select and typealias--

SELECT item AS 'Incidental Fee Item',
	   amountPerSemester AS 'Current Fee',
	   amountPerSemester * 1.1 AS 'Increased Fee'
FROM IncidentalFee
ORDER BY item

--Multi Condition Select--

SELECT number
FROM Room
WHERE capacity >= 40
	  AND isLab = 1
	  AND campusCode = 'D'
	  AND memory = '4GB'

--Range Select--

SELECT *
FROM Employee
WHERE schoolCode = 'TAP'
	  AND campusCode in ('D', 'G', 'W')

--Select using string sunctions--

SELECT DISTINCT LEN(firstName) AS 'First Name Lengh'
FROM Person
ORDER BY LEN(firstName) DESC

--

SELECT firstName, 
	   LEFT(firstName, 1) AS 'First Initial',
	   LOWER(LEFT(firstName, 1)) AS 'Lower First Initial'
FROM Person
WHERE LEFT(lastName, 1) = 'P'
ORDER BY firstName ASC

--

SELECT lastName, 
	   SUBSTRING(lastName, 1, 7) AS 'First Seven',
	   LOWER(SUBSTRING(lastName, 1, 7)) AS 'Lower First Seven'
FROM Person
WHERE SUBSTRING(lastName, 1, 1) = 'P'
ORDER BY lastName

--

SELECT CONCAT(LOWER(LEFT(firstName, 1)), LOWER(SUBSTRING(lastName, 1, 7))) AS 'User Id'
FROM Person
WHERE LEFT(lastName, 1) = 'P'
ORDER BY 'User Id' ASC
