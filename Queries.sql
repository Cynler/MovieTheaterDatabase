/*
============================================================================================================================================================
DATABASES FINAL PROJECT DEMO(COMP 2650-13D)
	Authors: Eric Banach, Heather Medeiros, Cynthia Lu
    Last Edited: 8 April 2021
============================================================================================================================================================
*/
CREATE VIEW Customers_Movies 
		AS SELECT Customer_Name AS Customer, Movie_Title AS Movie 
		FROM CUSTOMER, Reservation, Screening, MOVIE 
        WHERE Customer.CustomerID = Reservation.CustomerID 
		AND Reservation.ScreeningID = Screening.ScreeningID 
        AND Screening.MovieID = Movie.MovieID;

/*
============================================================================================================================================================
QUERIES
============================================================================================================================================================

------------------------------------------------------------------------------------------------------------------------------------------------------------
Simple SELECT Operations
------------------------------------------------------------------------------------------------------------------------------------------------------------
*/
SELECT Customer_Name AS Customer, Customer_Email AS Email, Customer_Membership AS Membership
		FROM Customer 
        WHERE Customer_Membership = 'Gold' 
        OR Customer_Membership = 'Platinum';

SELECT Movie_Title AS Movie_Name, Movie_Rating AS Rating 
FROM Movie 
WHERE Movie_Rating='R';

SELECT CONCAT(Ifnull(Employee_FirstName,' ') , ' ', Ifnull(Employee_LastName,' ')) 
AS 'Employee_Name' FROM Employee;

/*
------------------------------------------------------------------------------------------------------------------------------------------------------------
JOINS
------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

SELECT Customer_Name AS Customer, Reservation_SeatNumber AS 'Seat Number', ScreeningID 
		FROM CUSTOMER 
        RIGHT JOIN RESERVATION 
        ON CUSTOMER.CustomerID = RESERVATION.CustomerID
        ORDER BY Customer_Name ASC;

SELECT Auditorium.AuditoriumID, TheaterID
FROM Auditorium
RIGHT JOIN Screening
ON Auditorium.AuditoriumID = Screening.AuditoriumID
ORDER BY AuditoriumID DESC;

SELECT ScreeningID, Screening.MovieID, AuditoriumID, Movie.Movie_Title FROM Screening 
INNER JOIN Movie 
ON Movie.MovieID = Screening.MovieID
ORDER BY Movie_Title DESC;

/*
------------------------------------------------------------------------------------------------------------------------------------------------------------
Index Demonstration
------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

CREATE INDEX Movie_Title_Index ON Movie(Movie_Title);

CREATE UNIQUE INDEX CustomerName_Index ON CUSTOMER (Customer_Name);        
SELECT Customer_Name AS 'Customers Watching Cars 2' FROM CUSTOMER WHERE CustomerID IN (SELECT CustomerID FROM RESERVATION WHERE ScreeningID IN (SELECT ScreeningID FROM SCREENING WHERE MovieID IN (SELECT MovieID FROM MOVIE WHERE Movie_Title = 'Cars 2')));

CREATE INDEX idx_EmployeeName
ON employee (Employee_FirstName, Employee_LastName);

/*
============================================================================================================================================================
Maintain Database by adding and deleting entry
============================================================================================================================================================
*/
--run entry
INSERT INTO Movie_Theater (TheaterID, Address, Telephone)
VALUES (6, '6 Sycamore Street', '(666)666-6666');

--delete entry 
DELETE FROM Movie_Theater WHERE TheaterID=6;

/*
============================================================================================================================================================
Add and Drop References to existing Table
============================================================================================================================================================
*/
--add ref to assign a default head manager for each theater
ALTER TABLE Movie_Theater 
ADD COLUMN ManagerID INT,
ADD CONSTRAINT FK_Theater3 FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE;

-drop ref
ALTER TABLE Movie_Theater 
DROP COLUMN ManagerID,
DROP CONSTRAINT FK_Theater3;
