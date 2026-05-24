-- PostgreSQL uses sequences for auto-incrementing primary keys.
-- Foreign keys are active by default, so no PRAGMA command is needed.

-- ==========================================
-- 1. Case Study: Auto Show
-- ==========================================
CREATE TABLE companies (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(40) NOT NULL
);

CREATE TABLE cars (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(40) NOT NULL, 
    company_id INT NOT NULL, 
    CONSTRAINT fk_cars_companies FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE
);

CREATE TABLE events (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(40) NOT NULL
);

CREATE TABLE event_participants (
    car_id INT NOT NULL, 
    event_id INT NOT NULL, 
    PRIMARY KEY (car_id, event_id), 
    CONSTRAINT fk_participants_cars FOREIGN KEY (car_id) REFERENCES cars(id) ON DELETE CASCADE, 
    CONSTRAINT fk_participants_events FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
);

-- ==========================================
-- 2. Case Study: Average Salary
-- ==========================================
CREATE TABLE departments (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(50) NOT NULL, 
    salary NUMERIC(12, 2) NOT NULL, -- NUMERIC is preferred in Postgres for financial precision
    department_id INT, 
    CONSTRAINT fk_employees_departments FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE SET NULL
);

-- ==========================================
-- 3. Case Study: Student Scores
-- ==========================================
CREATE TABLE students (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(255) NOT NULL, 
    score INT NOT NULL, 
    class INT NOT NULL
);

-- ==========================================
-- 4. Case Study: Manager Sales Hierarchy
-- ==========================================
CREATE TABLE employees_mng (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(255) NOT NULL, 
    manager_id INT, 
    CONSTRAINT fk_employees_manager FOREIGN KEY (manager_id) REFERENCES employees_mng(id) ON DELETE SET NULL
);

-- ==========================================
-- 5. Case Study: Movie Genres
-- ==========================================
CREATE TABLE genres (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(50) NOT NULL
);

CREATE TABLE movies (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(50) NOT NULL
);

CREATE TABLE movies_genres (
    movie_id INT NOT NULL, 
    genre_id INT NOT NULL, 
    PRIMARY KEY (movie_id, genre_id), 
    CONSTRAINT fk_moviesgenres_movies FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE, 
    CONSTRAINT fk_moviesgenres_genres FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE
);

-- ==========================================
-- 6. Case Study: Student Rankings
-- ==========================================
CREATE TABLE colleges (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(50) NOT NULL
);

CREATE TABLE students_rank (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(50) NOT NULL, 
    college_id INT, 
    CONSTRAINT fk_students_colleges FOREIGN KEY (college_id) REFERENCES colleges(id) ON DELETE SET NULL
);

CREATE TABLE rankings (
    student_id INT NOT NULL, 
    ranking INT NOT NULL, 
    year INT NOT NULL,
    CONSTRAINT fk_rankings_students FOREIGN KEY (student_id) REFERENCES students_rank(id) ON DELETE CASCADE
);

-- ==========================================
-- 7. Case Study: Welfare & Donations
-- ==========================================
CREATE TABLE benefactors (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(50) NOT NULL
);

CREATE TABLE donations (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    amount INT NOT NULL, 
    year INT NOT NULL, 
    benefactor_id INT, 
    CONSTRAINT fk_donations_benefactors FOREIGN KEY (benefactor_id) REFERENCES benefactors(id) ON DELETE SET NULL
);

-- ==========================================
-- 8. Case Study: Family Tree
-- ==========================================
CREATE TABLE people (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    mother_id INT, 
    father_id INT, 
    name VARCHAR(30) NOT NULL, 
    age INT NOT NULL, 
    CONSTRAINT fk_people_mother FOREIGN KEY (mother_id) REFERENCES people(id) ON DELETE SET NULL, 
    CONSTRAINT fk_people_father FOREIGN KEY (father_id) REFERENCES people(id) ON DELETE SET NULL
);