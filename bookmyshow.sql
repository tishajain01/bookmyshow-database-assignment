-- BookMyShow Database Assignment
-- MySQL 8.x compatible
-- P1: Database design, tables and sample data
-- P2: List all shows on a given date at a given theatre

DROP DATABASE IF EXISTS bookmyshow_db;
CREATE DATABASE bookmyshow_db;
USE bookmyshow_db;

-- =========================================================
-- P1: TABLE CREATION
-- =========================================================

CREATE TABLE theatres (
    theatre_id INT PRIMARY KEY AUTO_INCREMENT,
    theatre_name VARCHAR(100) NOT NULL,
    location VARCHAR(150) NOT NULL
);

CREATE TABLE screens (
    screen_id INT PRIMARY KEY AUTO_INCREMENT,
    theatre_id INT NOT NULL,
    screen_name VARCHAR(50) NOT NULL,

    CONSTRAINT fk_screens_theatre
        FOREIGN KEY (theatre_id)
        REFERENCES theatres(theatre_id),

    CONSTRAINT uq_screen_per_theatre
        UNIQUE (theatre_id, screen_name)
);

CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(200) NOT NULL,
    language VARCHAR(50) NOT NULL
);

CREATE TABLE formats (
    format_id INT PRIMARY KEY AUTO_INCREMENT,
    format_name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL,
    screen_id INT NOT NULL,
    format_id INT NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,

    CONSTRAINT fk_shows_movie
        FOREIGN KEY (movie_id)
        REFERENCES movies(movie_id),

    CONSTRAINT fk_shows_screen
        FOREIGN KEY (screen_id)
        REFERENCES screens(screen_id),

    CONSTRAINT fk_shows_format
        FOREIGN KEY (format_id)
        REFERENCES formats(format_id),

    -- A screen cannot have two shows at the same date and time.
    CONSTRAINT uq_screen_show_datetime
        UNIQUE (screen_id, show_date, show_time)
);

-- =========================================================
-- P1: SAMPLE DATA
-- =========================================================

INSERT INTO theatres (theatre_name, location)
VALUES
    ('PVR: Nexus', 'Mumbai');

INSERT INTO screens (theatre_id, screen_name)
VALUES
    (1, 'Screen 1'),
    (1, 'Screen 2'),
    (1, 'Screen 3');

INSERT INTO movies (movie_name, language)
VALUES
    ('Dasara', 'Telugu'),
    ('Kisi Ka Bhai Kisi Ki Jaan', 'Hindi'),
    ('Tu Jhoothi Main Makkaar', 'Hindi'),
    ('Avatar: The Way of Water', 'English');

INSERT INTO formats (format_name)
VALUES
    ('2D'),
    ('3D');

INSERT INTO shows
    (movie_id, screen_id, format_id, show_date, show_time)
