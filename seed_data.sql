-- Dari autoshow.txt
INSERT INTO companies(id, name) VALUES(1, 'Ford'), (2, 'General Motors'), (3, 'Toyota'), (4, 'Honda'), (5, 'Tesla');
INSERT INTO cars(id, name, companyId) VALUES(1, 'Aspire-Sedan', 1), (2, 'EcoSport-SUV', 1), (3, 'Mustang-Convertible', 1), (4, 'Chevrolet-Sedan', 2), (5, 'GMC-Terrain', 2), (6, 'Camry', 3), (7, 'Corolla', 3), (8, 'Civic', 4), (9, 'CR-V', 4), (10, 'Model S', 5);
INSERT INTO events(id, name) VALUES(1, 'Sedan Event'), (2, 'SUV Event'), (3, 'Convertible Event'), (4, 'Electric Expo'), (5, 'Global Auto Show');
INSERT INTO eventParticipants(carId, eventId) VALUES(1, 1), (4, 1), (6, 1), (8, 1), (2, 2), (5, 2), (9, 2), (3, 3), (10, 4), (10, 5), (6, 5), (3, 5);

-- Dari averagesalary.txt
INSERT INTO departments(id, name) VALUES(1, 'Administration'), (2, 'Human Resource'), (3, 'Engineering'), (4, 'Marketing'), (5, 'Sales');
INSERT INTO employees(id, name, salary, departmentId) VALUES(1, 'Rob', 1000, 1), (2, 'Sam', 1200, 1), (3, 'Bill', 800, 2), (4, 'Margo', 900, 2), (5, 'Adam', 1100, 3), (6, 'John', 1300, 3), (7, 'Lisa', 1500, 3), (8, 'Sarah', 1250, 4), (9, 'Tom', 1100, 4), (10, 'Jerry', 1050, 5), (11, 'Nina', 1400, 5), (12, 'Paul', 950, NULL);

-- Dari example_case.txt
INSERT INTO students(id, name, score, class) VALUES(1, 'Mark', 894, 7), (2, 'Bill', 894, 7), (3, 'Maria', 678, 8), (4, 'David', 733, 9), (5, 'John', 899, 9), (6, 'Rob', 802, 9), (7, 'Alice', 920, 7), (8, 'Zack', 850, 8), (9, 'Chloe', 910, 8), (10, 'Emma', 780, 9), (11, 'Liam', 640, 7), (12, 'Noah', 880, 8);

-- Dari managersalessqlite.txt
INSERT INTO employees_mng(id, name, managerId) VALUES(1, 'Rob', null), (2, 'Tom', null), (3, 'Roger', 1), (4, 'Victor', 3), (5, 'John', 4), (6, 'Shawn', 2), (7, 'Alice', 1), (8, 'Bob', 2), (9, 'Charlie', 3), (10, 'Dave', 7), (11, 'Eve', 7), (12, 'Frank', 8);

-- Dari moviegenres.txt
INSERT INTO genres(name) VALUES
('Comedy'), ('Action'), ('Thriller'), ('Science Fiction'), ('Romance'), ('Horror');

INSERT INTO movies(name) VALUES
('Bad Boys'), ('Source Code'), ('The Bourne Ultimatum'), ('Inception'), 
('Titanic'), ('The Conjuring'), ('Deadpool'), ('Interstellar'),
('The Dark Knight'), ('Avengers: Endgame'), ('Get Out'), 
('Parasite'), ('La La Land'), ('Mad Max: Fury Road'), 
('The Matrix'), ('John Wick'), ('Knives Out'), 
('Everything Everywhere All at Once'), ('A Quiet Place'), 
('Doctor Strange'), ('Spider-Man: Into the Spider-Verse'), 
('Hereditary'), ('Midsommar'), ('Whiplash'), 
('The Grand Budapest Hotel'), ('Arrival'), ('Ex Machina'), 
('Annihilation'), ('Nope'), ('Us'), ('Oppenheimer'), 
('Dune'), ('Top Gun: Maverick'), ('The Menu'), 
('Bullet Train'), ('Glass Onion'), ('Barbarian'), 
('The Batman');

INSERT INTO moviesGenres(movieId, genreId) VALUES
(1, 1), (1, 2), (1, 3), (1, 4),
(2, 2), (2, 3), (2, 4),
(3, 2), (3, 3),
(4, 2), (4, 4), (4, 3),
(5, 5),
(6, 6), (6, 3),
(7, 1), (7, 2),
(8, 4), (8, 5),
(9, 2), (9, 3),
(10, 2), (10, 4),
(11, 6), (11, 3),
(12, 3),
(13, 5), (13, 1),
(14, 2), (14, 4),
(15, 2), (15, 4),
(16, 2), (16, 3),
(17, 3), (17, 1),
(18, 1), (18, 4),
(19, 6), (19, 3),
(20, 2), (20, 4),
(21, 2), (21, 4), (21, 1),
(22, 6), (22, 3),
(23, 6), (23, 3),
(24, 3),
(25, 1), (25, 3),
(26, 4), (26, 3),
(27, 4), (27, 3),
(28, 4), (28, 6),
(29, 6), (29, 4),
(30, 6), (30, 3),
(31, 3), (31, 4),
(32, 4), (32, 2),
(33, 2), (33, 3),
(34, 3), (34, 6),
(35, 2), (35, 1),
(36, 3), (36, 1),
(37, 6), (37, 3),
(38, 2), (38, 3);

-- Dari studentrankings.txt
INSERT INTO colleges(id, name) VALUES(1, 'Pi Institute Of Engineering'), (2, 'Kappa Institute Of Technology'), (3, 'Omega Science Academy'), (4, 'Alpha Business School');
INSERT INTO students_rank(id, name, collegeId) VALUES(1, 'Rob', 1), (2, 'Shawn', 1), (3, 'Bill', 2), (4, 'Steve', 2), (5, 'Roger', 3), (6, 'Megan', 3), (7, 'Luke', 4), (8, 'Leia', 4), (9, 'Han', 1), (10, 'Chewie', 2);
INSERT INTO rankings(studentId, ranking, year) VALUES(1, 1, 2014), (6, 2, 2014), (7, 3, 2014), (8, 4, 2014), (3, 1, 2015), (4, 2, 2015), (2, 3, 2015), (5, 4, 2015), (9, 1, 2016), (10, 2, 2016), (1, 3, 2016), (3, 4, 2016);

-- Dari welfare.txt
INSERT INTO benefactors(id, name) VALUES(1, 'Phil'), (2, 'Nicholas'), (3, 'William'), (4, 'Warren'), (5, 'Bill G');
INSERT INTO donations(id, amount, year, benefactorId) VALUES(1, 2000, 2014, 1), (2, 2800, 2015, 1), (3, 900, 2015, 1), (4, 1200, 2015, 2), (5, 3200, 2015, null), (6, 4000, 2015, null), (7, 2400, 2016, 2), (8, 5000, 2016, 3), (9, 1500, 2017, 3), (10, 10000, 2017, 4), (11, 8500, 2017, 5), (12, 300, 2017, null);

-- Dari youngestchild.txt
INSERT INTO people(id, motherId, fatherId, name, age) VALUES(1, NULL, NULL, 'Adam', 50), (2, NULL, NULL, 'Eve', 50), (3, 2, 1, 'Cain', 30), (4, 2, 1, 'Seth', 20), (5, NULL, NULL, 'Mary', 45), (6, NULL, NULL, 'Joseph', 48), (7, 5, 6, 'Jesus', 25), (8, 5, 6, 'James', 22), (9, 2, 1, 'Abel', 28), (10, NULL, NULL, 'Sarah', 60), (11, NULL, NULL, 'Abraham', 65), (12, 10, 11, 'Isaac', 40);