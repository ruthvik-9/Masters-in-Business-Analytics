-- Ruthvik Rajan Banda CWID:50326130

-- PART 3 Question 1
-- Creating a Schema/database for the given question
CREATE SCHEMA TAMUCAIRLINES;

-- using the schema to work on the database
USE TAMUCAIRLINES;
-- Creating a table plane to know the plane details in the table
CREATE TABLE Plane (
PlaneID NVARCHAR(10) NOT NULL PRIMARY KEY,
Planetype VARCHAR(10) NOT NULL,
NoOfSeats INT(3) NOT NULL);

-- creating a table  flight  with two primary keys in the table
CREATE TABLE Flight (
FlightNo NVARCHAR(10) NOT NULL,
FlightDATE DATE NOT NULL,
BoardingTime TIME NOT NULL,
GATE NVARCHAR(4) NOT NULL,
PRIMARY KEY (FlightNo,FlightDate)
);

-- Creating a table for passengers
CREATE TABLE Passenger (
PassengerID INT(5) NOT NULL PRIMARY KEY,
PassengerName VARCHAR(50) NOT NULL,
PassengerAddress VARCHAR(100) NOT NULL,
City VARCHAR(20) NOT NULL,
State VARCHAR(20)NOT NULL,
ZipCode NVARCHAR(10) NOT NULL
);

-- creating table ticket forming associative entity as shown in the figure.
CREATE TABLE Ticket(
TicketID INT(5) NOT NULL,
PlaneID NVARCHAR(10) NOT NULL,
FlightNo NVARCHAR(10) NOT NULL,
FlightDate DATE NOT NULL,
Price FLOAT(8) NOT NULL,
PassengerID INT(5),
PRIMARY KEY(TicketID,PlaneID,FlightNo,FlightDATE),
FOREIGN KEY (PlaneID) REFERENCES Plane(PlaneID),
FOREIGN KEY (FlightNo) REFERENCES Flight(FlightNo),
FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
);

---------------------###------------------------###-------------------###-----------------------------------------
---------------------###-----------------------###----------------------###---------------------------------------


-- Part 3 , Question 2

-- USE midterm data to answer the given queries
USE midterm;

-- Q1. Show all tournament info.

SELECT * 
FROM Tournaments t , tourney_matches tm
WHERE t.tourneyid=tm.tourneyid;

-- Q2.Show the team names, and captain last name and captain first name for each team.

SELECT t.teamname,b.bowlerfirstname,b.bowlerlastname
FROM teams t,bowlers b
WHERE t.captainID=b.bowlerid;

-- Q3.Show all information of bowlers and their teams regardless they play for a team or not.

SELECT *
FROM bowlers b
RIGHT JOIN teams t ON t.teamid=b.teamid;

-- Q4. Show tournament location, odd lane team name, and even lane team name for each match in tournament.

SELECT ts.tourneylocation,t.teamname AS OddTeam,t1.teamname AS EvenTeam
FROM (Tourney_matches tm
INNER JOIN teams t ON t.teamid=tm.oddlaneteamid
INNER JOIN teams t1 ON t1.teamid=tm.evenlaneteamid),tournaments ts
WHERE  ts.tourneyID=tm.tourneyID;

-- Q5. List info of bowlers who have not played any match.

SELECT*
FROM Bowlers b
WHERE b.bowlerid NOT IN
		(SELECT bs.bowlerid FROM bowler_scores bs WHERE bs.bowlerid=b.bowlerid);
        
-- Q6. List the team that played only in even lanes.

SElECT distinct teamname
FROM tourney_matches tm
JOIN teams t ON t.teamid=tm.evenlaneteamid;

-- Q7. Display team captains with a handicap score higher than all other members on their team.

SELECT t.TeamName, b.BowlerID,b.BowlerFirstName,bs.HandiCapScore
FROM (Bowlers b
INNER JOIN Teams  t ON b.BowlerID = t.CaptainID)
INNER JOIN Bowler_Scores bs ON b.BowlerID = bs.BowlerID
WHERE bs.HandiCapScore > All
(SELECT bs1.HandiCapScore
FROM Bowlers AS b1
INNER JOIN Bowler_Scores AS bs1 ON b1.BowlerID = bs1.BowlerID
WHERE b1.BowlerID <> b.BowlerID AND b1.TeamID = b.TeamID);

-- Q8. List all the bowlers who have the lowest raw score for each team.

SELECT b.BowlerID,b.BowlerFirstName,b.BowlerLastName,bs.rawscore
FROM (Bowlers b
INNER JOIN teams t ON t.teamid=b.teamid)
INNER JOIN Bowler_Scores bs ON b.BowlerID = bs.BowlerID
WHERE bs.rawscore < All
(SELECT bs1.rawscore
FROM Bowlers AS b1
INNER JOIN Bowler_Scores AS bs1 ON b1.BowlerID = bs1.BowlerID
WHERE b1.BowlerID <> b.BowlerID AND b1.TeamID = b.TeamID);





