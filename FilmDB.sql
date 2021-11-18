CREATE DATABASE FilmDB

USE FilmDB

CREATE TABLE Genres
(
	Id INT IDENTITY PRIMARY KEY,
	Name VARCHAR(20),
)

INSERT INTO Genres
VALUES
('Drama'),
('Sci-Fi'),
('War'),
('Action')

CREATE TABLE Movies
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(30),
	GenreId INT FOREIGN KEY REFERENCES Genres(Id),
)

INSERT INTO Movies
VALUES
('Joker', 4),
('The Platform', 4),
('Interstellar', 5),
('The Shawshank Redemption', 4),
('Lucy', 5),
('Saving Private Ryan', 6)

CREATE TABLE Actors
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(20),
	SurName NVARCHAR(20),
	Age INT
)

INSERT INTO Actors
VALUES
('Will', 'Smith', 32),
('Leonardo', 'DiCaprio', 36),
('Morgan', 'Freeman', 53),
('Benedict', 'Cumberbatch', 24)

CREATE TABLE ActorMovies
(
	Id INT IDENTITY PRIMARY KEY,
	MovieId INT FOREIGN KEY REFERENCES Movies(Id),
	ActorId INT FOREIGN KEY REFERENCES Actors(Id),
)

INSERT INTO ActorMovies
VALUES
(2,1),
(2,2),
(3,1),
(3,2),
(3,3),
(4,1),
(4,2),
(4,3),
(5,2)

--Query 1
SELECT *, (SELECT COUNT(Id) FROM Movies WHERE GenreId = Genres.Id) AS 'Movie Count' FROM Genres

--Query 2
SELECT * FROM Actors WHERE Age > (SELECT AVG(Age) FROM Actors)

--Query 3
SELECT A.Name, A.SurName, A.Age, M.Name FROM ActorMovies AS AMs
JOIN Actors AS A ON A.Id = AMs.ActorId
JOIN Movies AS M ON M.Id = AMS.MovieId
ORDER BY AMs.ActorId

--Query 4
SELECT * FROM Actors AS A
WHERE EXISTS (SELECT * FROM ActorMovies AS AMs WHERE Ams.ActorId = A.Id)