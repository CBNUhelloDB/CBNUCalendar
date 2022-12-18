DROP DATABASE IF EXISTS events_calendar;
CREATE DATABASE events_calendar;
USE events_calendar;

-- 1
CREATE TABLE user(
	id INT NOT NULL,
    password VARCHAR(30),
    full_name VARCHAR(100),
    email VARCHAR(100),
    birthdate DATE,
    grade ENUM('freshman', 'sophomore', 'junior', 'senior'),
    department VARCHAR(100),
    PRIMARY KEY(id)
);

-- 2
CREATE TABLE club(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    manager_id INT NOT NULL,
    open_date DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (manager_id) REFERENCES user(id)
);

-- 2.5
CREATE TABLE club_member(
	user_id INT NOT NULL,
    club_id INT NOT NULL,
    join_date DATE,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (club_id) REFERENCES club(id),
    PRIMARY KEY (user_id, club_id)
);

-- 3
CREATE TABLE location(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
    subtitle VARCHAR(100),
    address VARCHAR(255),
    capacity INT,
    phone_num VARCHAR(50),
    PRIMARY KEY (id)
);

-- 4
CREATE TABLE event(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    subtitle VARCHAR(255),
    date DATE,
    location_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

-- 4.5
CREATE TABLE host( -- club and event
    club_id INT NOT NULL,
    event_id INT NOT NULL,
    FOREIGN KEY (club_id) REFERENCES club(id),
    FOREIGN KEY (event_id) REFERENCES event(id) ON DELETE CASCADE,
    PRIMARY KEY (club_id, event_id)
); 

-- 5 
CREATE TABLE participants( -- user and event
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    PRIMARY KEY (user_id, event_id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (event_id) REFERENCES event(id) ON DELETE CASCADE
);

-- 6
CREATE TABLE review(
	id INT NOT NULL AUTO_INCREMENT,
    event_id INT NOT NULL,
    author INT NOT NULL,
    review TEXT,
    score ENUM('very bad', 'bad', 'neutral', 'good', 'very good'),
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id) ON DELETE CASCADE,
    FOREIGN KEY (author) REFERENCES user(id)
);

-- 7
CREATE TABLE club_community( -- individual web page of each club
    id INT NOT NULL AUTO_INCREMENT,
    name TEXT,
    opening_date DATE,
    member INT,
    PRIMARY KEY(id)
);

-- 8
CREATE TABLE user_and_community( 
    community_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (community_id) REFERENCES club_community(id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    PRIMARY KEY (community_id, user_id)
);

-- 9
CREATE TABLE post(
    id INT NOT NULL AUTO_INCREMENT,
    author INT NOT NULL,
    community_id INT NOT NULL,
    title TEXT,
    content TEXT,
    view INT,
    upvote INT,
    downvote INT,    
    FOREIGN KEY (author) REFERENCES user(id),
    FOREIGN KEY (community_id) REFERENCES club_community(id),
    PRIMARY KEY (id)
);