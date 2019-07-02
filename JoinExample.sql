USE SIS

--INNER JOIN--

SELECT  Course.number AS CourseCode, Course.name AS CourseName, 
		CoursePrerequisiteAnd.prerequisiteNumber
FROM CoursePrerequisiteAnd
  INNER JOIN Course
	ON Course.number = CoursePrerequisiteAnd.courseNumber
WHERE CoursePrerequisiteAnd.courseNumber = 'COMP2280'
ORDER BY CoursePrerequisiteAnd.courseNumber

--

SELECT LOWER(Left(Person.firstName, 1) + LEFT(Person.lastName, 7)) AS 'User Id', Employee.schoolCode, Employee.extension
FROM Person
	INNER JOIN Employee
	 ON Person.number = Employee.number
WHERE LEFT(Person.lastName, 1) = 'K'
ORDER BY 'User Id' ASC

--LEFT JOIN--

SELECT Employee.number, Person.firstName, Person.lastName, Employee.schoolCode, Employee.extension
FROM Employee
	LEFT JOIN Person
	 ON Person.number = Employee.number
WHERE Person.lastName LIKE 'W%'
ORDER BY Employee.number

--

SELECT e1.number as 'Employee', e1.reportsTo as 'Employee Reports To', e2.reportsTo as 'Supervisor Reports To'
FROM Employee AS e1
	LEFT JOIN Employee AS e2
	ON e1.reportsTo = e2.number
ORDER By e1.number

--

SELECT Person.number, Person.firstName, Person.lastName, Person.city
FROM Person
	LEFT JOIN Student
	  ON Student.number = Person.number
WHERE Student.number is NULL
ORDER BY Person.lastName

--

SELECT Course.number, Course.hours, Course.credits, Course.name
FROM Course
	LEFT JOIN CourseOffering
	 ON Course.number = CourseOffering.courseNumber
WHERE CHARINDEX('Programming', Course.name) > 0
	AND CourseOffering.courseNumber IS NULL
ORDER BY Course.number

--MULTI JOINS--

SELECT Software.uniqueId, Software.product
FROM Room
	INNER JOIN LabSoftware
		ON Room.id = LabSoftware.roomId
	INNER JOIN Software
		ON LabSoftware.softwareUniqueId = Software.uniqueId
WHERE Room.number = '2A205'
ORDER BY Software.product

--

SELECT CourseOffering.sessionCode, CourseOffering.courseNumber, Person.firstName, Person.lastName, Employee.extension
FROM CourseOffering
	INNER JOIN Employee
		ON Employee.number = CourseOffering.employeeNumber
	INNER JOIN Person
		ON Person.number = Employee.number
WHERE CourseOffering.sessionCode = 'F10'
ORDER BY CourseOffering.courseNumber

--

SELECT CONCAT(Person.firstName, ' ', Person.lastName) AS name, Person.collegeEmail, Person.personalEmail, StudentOffence.notes AS reason
FROM Student
	INNER JOIN StudentOffence
	 ON Student.number = StudentOffence.studentNumber
	INNER JOIN Person
	 ON Student.number = Person.number
ORDER BY Student.number
