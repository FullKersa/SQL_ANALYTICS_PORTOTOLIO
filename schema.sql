PRAGMA foreign_keys = ON;

-- Dari autoshow.txt
CREATE TABLE companies (id INTEGER PRIMARY KEY, name VARCHAR(40) NOT NULL);
CREATE TABLE cars (id INTEGER PRIMARY KEY, name VARCHAR(40) NOT NULL, companyId INTEGER NOT NULL, FOREIGN KEY (companyId) REFERENCES companies(id));
CREATE TABLE events (id INTEGER PRIMARY KEY, name VARCHAR(40) NOT NULL);
CREATE TABLE eventParticipants (carId INTEGER NOT NULL, eventId INTEGER NOT NULL, PRIMARY KEY(carId, eventId), FOREIGN KEY (carId) REFERENCES cars(id), FOREIGN KEY (eventId) REFERENCES events(id));

-- Dari averagesalary.txt
CREATE TABLE departments (id INTEGER PRIMARY KEY, name VARCHAR(50) NOT NULL);
CREATE TABLE employees (id INTEGER PRIMARY KEY, name VARCHAR(50) NOT NULL, salary DECIMAL NOT NULL, departmentId INTEGER, FOREIGN KEY (departmentId) REFERENCES departments(id));

-- Dari example_case.txt
CREATE TABLE students (id INTEGER PRIMARY KEY, name VARCHAR(255) NOT NULL, score INTEGER NOT NULL, class INTEGER NOT NULL);

-- Dari managersalessqlite.txt
CREATE TABLE employees_mng (id INTEGER PRIMARY KEY, name VARCHAR(255) NOT NULL, managerId INTEGER, FOREIGN KEY (managerId) REFERENCES employees_mng(id));

-- Dari moviegenres.txt
CREATE TABLE genres (id INTEGER PRIMARY KEY, name VARCHAR(50) NOT NULL);
CREATE TABLE movies (id INTEGER PRIMARY KEY, name VARCHAR(50) NOT NULL);
CREATE TABLE moviesGenres (movieId INTEGER REFERENCES movies(id), genreId INTEGER REFERENCES genres(id), PRIMARY KEY(movieId, genreId), FOREIGN KEY (movieId) REFERENCES movies(id), FOREIGN KEY (genreId) REFERENCES genres(id));

-- Dari studentrankings.txt
CREATE TABLE colleges (id INTEGER PRIMARY KEY, name VARCHAR(50) NOT NULL);
CREATE TABLE students_rank (id INTEGER PRIMARY KEY, name VARCHAR(50) NOT NULL, collegeId INTEGER, FOREIGN KEY (collegeId) REFERENCES colleges(id));
CREATE TABLE rankings (studentId INTEGER, ranking INTEGER NOT NULL, year INTEGER NOT NULL, FOREIGN KEY (studentId) REFERENCES students_rank(id));

-- Dari welfare.txt
CREATE TABLE benefactors (id INTEGER PRIMARY KEY, name VARCHAR(50) NOT NULL);
CREATE TABLE donations (id INTEGER PRIMARY KEY, amount INTEGER NOT NULL, year INTEGER NOT NULL, benefactorId INTEGER, FOREIGN KEY (benefactorId) REFERENCES benefactors(id));

-- Dari youngestchild.txt
CREATE TABLE people (id INTEGER NOT NULL PRIMARY KEY, motherId INTEGER, fatherId INTEGER, name VARCHAR(30) NOT NULL, age INTEGER NOT NULL, FOREIGN KEY (motherId) REFERENCES people(id), FOREIGN KEY (fatherId) REFERENCES people(id));