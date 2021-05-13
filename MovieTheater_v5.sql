/* 
================================================================================================================================
DATABASES FINAL PROJECT (COMP 2650-13D)
	Authors: Eric Banach, Heather Medeiros, Cynthia Lu
    Last Edited: 7 April 2021
================================================================================================================================
*/
DROP SCHEMA final_project;
CREATE SCHEMA final_project;
USE final_project;

/* 
================================================================================================================================
TABLE Creation
	-In the following code, each of the tables is craeted along with
    the proper data fields. Primary and Foreign keys are designated.
================================================================================================================================
*/
CREATE TABLE CUSTOMER	
		(CustomerID				INT 				NOT NULL,
		Customer_Name			VARCHAR(25)					,
        Customer_DOB			DATE						,
        Customer_Address		VARCHAR(40)					,
        Customer_Membership		ENUM('None', 'Gold', 'Platinum') DEFAULT 'None',
        Customer_Email        	VARCHAR(25)					,
CONSTRAINT Customer_PK PRIMARY KEY (CustomerID));

CREATE TABLE MOVIE
		(MovieID				INT 				NOT NULL,
		Movie_Title 			VARCHAR(35)					,
		Movie_Director			VARCHAR(30)					,
		Movie_Cast				VARCHAR(50)					,
		Movie_Rating 			VARCHAR(5)					,
		Movie_Duration 			INT							,
		Movie_Description 		VARCHAR(75)					,
CONSTRAINT Movie_pk PRIMARY KEY (MovieID));

CREATE TABLE MOVIE_THEATER
		(TheaterID 				INT 				NOT NULL,
		Address 				VARCHAR(20)					,
		Telephone 				VARCHAR(13)					,
CONSTRAINT MovieTheater_pk PRIMARY KEY (TheaterID));

CREATE TABLE AUDITORIUM
		(AuditoriumID			INT 				NOT NULL,
        TheaterID				INT							,
        Auditorium_SeatNo		INT							,
CONSTRAINT Auditorium_PK PRIMARY KEY (AuditoriumID),
CONSTRAINT FK_Theater FOREIGN KEY (TheaterID) REFERENCES Movie_Theater (TheaterID));

CREATE TABLE Screening
		(ScreeningID 			INT 				NOT NULL,
		MovieID 				INT							,
		AuditoriumID			INT							,
		Screening_3DMovie 		BOOL						,
		Screening_Subtitles		BOOL						,
CONSTRAINT Screening_pk PRIMARY KEY (ScreeningID),
CONSTRAINT FK_Movie FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
CONSTRAINT FK_Auditorium FOREIGN KEY (AuditoriumID) REFERENCES Auditorium(AuditoriumID));

CREATE TABLE Employee 
		(EmployeeID 			INT 				NOT NULL,
        TheaterID				INT							,
		Employee_FirstName 		VARCHAR(15)					,
		Employee_LastName 		VARCHAR(15)					,
		Employee_DOB 			DATE						,
		Employee_Job 			VARCHAR(20)					,
		Employee_Telephone 		VARCHAR(14) 		NOT NULL, 
		Employee_Address 		VARCHAR(20)					, 
		Employee_City 			VARCHAR(20)					,
		Employee_State 			VARCHAR(2)					,
		Employee_Zip 			NUMERIC(5,0) 		NOT NULL,
CONSTRAINT Employee_pk primary key(EmployeeID),
CONSTRAINT FK_Theater2 FOREIGN KEY (TheaterID) REFERENCES Movie_Theater (TheaterID));

CREATE TABLE RESERVATION
		(ReservationID			INT 				NOT NULL,
        ScreeningID				INT							,
        CustomerID				INT							,
        Reservation_SeatNumber 	INT							,
CONSTRAINT Reservation_PK PRIMARY KEY (ReservationID),
CONSTRAINT FK_Scr FOREIGN KEY (ScreeningID) REFERENCES SCREENING (ScreeningID),
CONSTRAINT FK_Cust FOREIGN KEY (CustomerID) REFERENCES CUSTOMER (CustomerID));


/* 
================================================================================================================================
TABLE POPULATION
	-In the following code, each of the tables is populated with data
================================================================================================================================
*/
INSERT INTO Customer VALUES (123,"Allan", '1989/05/23', "67 South St.", 'Gold', "Alallan@hotmail.com");
INSERT INTO Customer VALUES (232,"Rose", '1998/02/02', "2 Broadway St.", 'None', "Roseario@gmail.com");
INSERT INTO Customer VALUES (321,"Glenn", '1968/09/30', "34 Crooke Ave.", 'Platinum', "Glenngm,@gmail.com");
INSERT INTO Customer VALUES (214,"Freddy", '2001/03/03', "5 Main st.", 'None', "FredFred@gmail.com");
INSERT INTO Customer VALUES (872,"Katie", '1979/02/21', "671 Joesph Rd.", 'Gold', "KattieKat@hotmail.com");
INSERT INTO Customer VALUES (679,"Brandon", '1998/12/02', "10 Racecourse Rd.", 'Gold', "coolguy28@gmail.com");
INSERT INTO Customer VALUES (241,"Roland", '1999/11/09', "109 Country St.", 'None', "Rolandro312@gmail.com");
INSERT INTO Customer VALUES (874,"Darell", '1967/07/29', "28 North St.", 'None', "DBarnes@gmail.com");
INSERT INTO Customer VALUES (203,"Marry", '1958/09/17', "20 Circle st.", 'Gold', "MarryMoss@Gmail.com");
INSERT INTO Customer VALUES (732,"Jolene", '1978/02/12', "3 Parker Av.", 'Platinum', "Jojojo23@hotmail.com");
INSERT INTO Customer VALUES (832,"Hannah", '1989/04/20', "23 Commonwealth Av.", 'Gold', "HiltopH2@gmail.com");
INSERT INTO Customer VALUES (753,"Kim", '1973/01/13', "381 Langton Springs", 'Platinum', "KimK@gmail.com");
INSERT INTO Customer VALUES (543,"Jessica", '2000/03/05', "3 Greenwoods Dr.", 'None', "JessicaJ@gmail.com");
INSERT INTO Customer VALUES (421,"Miles", '1905/12/17', "4 Bishop Banks St.", 'None', "mmMiles@gmail.com");
INSERT INTO Customer VALUES (521,"Molly", '1998/06/12', "29 Nightgale St.", 'Gold', "Mollyminaj@gmail.com");
INSERT INTO Customer VALUES (821,"Karen", '1978/06/17', "17 Lowland Av.", 'None', "Managerplease@hotmail.com");
INSERT INTO Customer VALUES (129,"Kandy", '1989/10/20', "20 Olive Way", 'Gold', "KandyLand@hotmail.com");
INSERT INTO Customer VALUES (209,"Meg", '1998/08/19', "20 River Lane", 'Platinum',"meggy2981@gmail.com");
INSERT INTO Customer VALUES (302,"Alex", '2005/07/20', "406 Sugarplum Av.", 'None', "alexalec@gmail.com");
INSERT INTO Customer VALUES (103,"Bethany", '1978/04/03', "6 Commercial Way", 'Gold', "BethBet@gmail.com");
INSERT INTO Customer VALUES (903,"Carmella", '1989/09/23', "1 Rose St.", 'Platinum', "CarmellaC@hotmail.com");
INSERT INTO Customer VALUES (904,"Carmellas", '1989/09/23', "12 Rose St.", 'Platinum', "CarmellasC@hotmail.com");

INSERT INTO MOVIE VALUES (111, 'Borat', 'Woliner', 'Sasha Baron Cohen', 'R', 2, 'Its about Borat');
INSERT INTO MOVIE VALUES (222, 'Parasite', 'Joon-ho', 'Kang-ho Song', 'R', 2, 'Its about Parasite');
INSERT INTO MOVIE VALUES (333, 'The Grand Budapest Hotel', 'Anderson', 'Ralph Fiennes', 'R', 2, 'Its about Hotel');
INSERT INTO MOVIE VALUES (444, 'Inception', 'Nolan', 'Leonardo DiCaprio', 'PG-13', 2, 'Its about dreams');
INSERT INTO MOVIE VALUES (555, 'Interstellar', 'Nolan', 'Matthew McConaughey', 'PG-13', 2, 'Its about space');
INSERT INTO MOVIE VALUES (666, 'Django Unchained', 'Tarantino', 'Micheal Fox', 'R', 2, 'Its about cowboys');
INSERT INTO MOVIE VALUES (777, 'Full Metal Jacket', 'Kubrick', 'Matthew Modine', 'R', 2, 'Its about Vietnam');
INSERT INTO MOVIE VALUES (888, 'Skyfall, Mendes', 'Sam Mendes', 'Daniel Craig', 'R', 2, 'Its about spies');
INSERT INTO MOVIE VALUES (999, 'Killer Bean', 'Lew', 'Vegas Jenkings', 'R', 2, 'Its about beans');
INSERT INTO MOVIE VALUES (1010, 'Cars 2', 'Lasseter', 'Owen Wilson', 'G', 2, 'Its about cars');
INSERT INTO MOVIE VALUES (1111, 'Jojo Rabbit', 'Waititi', 'Roman Griffin Davis', 'R', 2, 'Its about Germany');
INSERT INTO MOVIE VALUES (1212, 'Dune', 'Lynch', 'Timothee Chalamet', 'PG-13', 2, 'Its about desert');
INSERT INTO MOVIE VALUES (1313, 'Hardcore Henry', 'Naishuller', 'Ilya Naishuller', 'R', 2, 'Its about Henry');

INSERT INTO MOVIE_THEATER VALUES (1, '1 Maple Street', '(111)111-1111');
INSERT INTO MOVIE_THEATER VALUES (2, '2 Birch Street', '(222)222-2222');
INSERT INTO MOVIE_THEATER VALUES (3, '3 Pine Street', '(333)333-3333');
INSERT INTO MOVIE_THEATER VALUES (4, '4 Oak Street', '(444)444-4444');
INSERT INTO MOVIE_THEATER VALUES (5, '5 Willow Street', '(555)555-5555');

INSERT INTO AUDITORIUM VALUES (1, 1, 100);
INSERT INTO AUDITORIUM VALUES (2, 4, 150);
INSERT INTO AUDITORIUM VALUES (3, 5, 200);
INSERT INTO AUDITORIUM VALUES (4, 2, 300);
INSERT INTO AUDITORIUM VALUES (5, 2, 125);

INSERT INTO SCREENING VALUES (22, 444, 1, false, true);
INSERT INTO SCREENING VALUES (1145, 1010, 2, true, true);
INSERT INTO SCREENING VALUES (555, 333, 3, true, true);
INSERT INTO SCREENING VALUES (345, 777, 4, false, true);
INSERT INTO SCREENING VALUES (11, 555, 5, false, true);

INSERT INTO RESERVATION VALUES (1111, 22, 123, 54);
INSERT INTO RESERVATION VALUES (2222, 1145, 241, 11);
INSERT INTO RESERVATION VALUES (3333, 555, 874, 45);
INSERT INTO RESERVATION VALUES (4444, 345, 203, 1);
INSERT INTO RESERVATION VALUES (5555, 11, 872, 21);

INSERT INTO Employee VALUES ('11506', '1', 'Jane', 'Doe', '1970-01-01', 'lobby attendent', '(111)111-1121', '32 Mock St', 'Forest Hill', 'MA', '31312');
INSERT INTO Employee VALUES ('12089', '2', 'Virginia', 'Moles', '1975-03-06', 'lobby attendent', '(850)858-9788', '19 Woodside', 'Pensacola', 'FL', '32507');
INSERT INTO Employee VALUES ('13456', '3', 'Daniel', 'Brock', '1976-08-21', 'lobby attendent', '(281)347-9364', '40 Rich Ave', 'Katy', 'TX', '77450');
INSERT INTO Employee VALUES ('14409', '4', 'Kenneth', 'Wall', '1966-12-15', 'lobby attendent', '(682)622-1659', '14 Sycamore', 'Fort Worth', 'TX', '76104');
INSERT INTO Employee VALUES ('15032', '5', 'Dorothy', 'Welker', '1997-11-12', 'lobby attendent', '(845)321-9422', '22 Oak', 'Arlington', 'IL', '60005');
INSERT INTO Employee VALUES ('11001', '1', 'Dean', 'Howard', '1960-09-01', 'Manager', '(740)886-7520', '25 Old House', 'Proctor', 'OH', '45666');
INSERT INTO Employee VALUES ('12011', '2', 'Henry', 'Roessler', '1968-02-24', 'Manager', '(847)824-2025', '36 Pine', 'Des Plain', 'IL', '60016');
INSERT INTO Employee VALUES ('13051', '3', 'Vivian', 'Hurd', '1975-10-12', 'Manager', '(501)224-6347', '33 Clinton', 'Little Rock', 'AR', '72211');
INSERT INTO Employee VALUES ('14022', '4', 'Linda', 'Richardson', '1956-12-17', 'Manager', '(580)995-7049', '29 Caldwell', 'Terre', 'IN', '47801');
INSERT INTO Employee VALUES ('15068', '5', 'Bruce', 'McCarter', '1996-03-22', 'Manager', '(972)735-8973', '12 Larla', 'Dallas', 'TX', '75287');
INSERT INTO Employee VALUES ('11455', '1', 'Shirley', 'Maddocks', '1958-06-05', 'Projectionist', '(541)274-7306', '43 New St', 'Eugene', 'OR', '97402');
INSERT INTO Employee VALUES ('12408', '2', 'Edward', 'Cooke', '1985-04-04', 'Projectionist', '(480)733-7487', '736 Dye St', 'HURON', 'IN', '47437');
INSERT INTO Employee VALUES ('13472', '3', 'Kenneth', 'Gorham', '1992-11-10', 'Projectionist', '(212)930-0958', '116 Rosewood', 'New York', 'NY', '10036');
INSERT INTO Employee VALUES ('14490', '4', 'Reba', 'Tovar', '1956-08-05', 'Projectionist', '(405)722-9165', '423 Ruckman', 'Oklahoma', 'OK', '76213');
INSERT INTO Employee VALUES ('15483', '5', 'Alice', 'Peterson', '1976-12-07', 'Projectionist', '(209)256-1453', '28 Maple Ave', 'Stockton', 'CA', '95219');


/* 
================================================================================================================================
View Creation
	-In the following code, a view is created to display both the customer name
    and the title of the movie they will be viewing. Note that only customers
    that are viewing movies will be shown.
================================================================================================================================
*/
CREATE VIEW Customers_Movies 
		AS SELECT Customer_Name AS Customer, Movie_Title AS Movie 
		FROM CUSTOMER, Reservation, Screening, MOVIE 
        WHERE Customer.CustomerID = Reservation.CustomerID 
		AND Reservation.ScreeningID = Screening.ScreeningID 
        AND Screening.MovieID = Movie.MovieID;

/* 
================================================================================================================================
Simple Queries
================================================================================================================================
*/
SELECT Customer_Name AS Customer, Customer_Email AS Email, Customer_Membership AS Membership
		FROM Customer 
        WHERE Customer_Membership = 'Gold' 
        OR Customer_Membership = 'Platinum';

/* 
================================================================================================================================
Intermediate Queries
================================================================================================================================
*/
SELECT Customer_Name AS Customer, Reservation_SeatNumber AS 'Seat Number', ScreeningID 
		FROM CUSTOMER 
        RIGHT JOIN RESERVATION 
        ON CUSTOMER.CustomerID = RESERVATION.CustomerID
        ORDER BY Customer_Name ASC;

/* 
================================================================================================================================
Advanced Queries
================================================================================================================================
*/
CREATE UNIQUE INDEX CustomerName_Index ON CUSTOMER (Customer_Name);        
SELECT Customer_Name AS 'Customers Watching Cars 2' FROM CUSTOMER WHERE CustomerID IN (SELECT CustomerID FROM RESERVATION WHERE ScreeningID IN (SELECT ScreeningID FROM SCREENING WHERE MovieID IN (SELECT MovieID FROM MOVIE WHERE Movie_Title = 'Cars 2')));