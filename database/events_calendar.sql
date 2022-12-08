DROP DATABASE IF EXISTS events_calendar;
CREATE DATABASE events_calendar;
USE events_calendar;

CREATE TABLE user(
	id INT NOT NULL,
    password VARCHAR(55),
    full_name VARCHAR(255),
    email VARCHAR(255),
    birthdate DATE,
    grade VARCHAR(100),
    department VARCHAR(255),
    CONSTRAINT PKuser PRIMARY KEY(id)
);

CREATE TABLE club( -- clubs and its leader
    id INT NOT NULL,
    name VARCHAR(255),
    user_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE club_member( -- clubs and its members
    club_id INT NOT NULL,
    user_id INT NOT NULL,
    join_date DATE,
    PRIMARY KEY(club_id, user_id),
    FOREIGN KEY(club_id) REFERENCES club(id),
    FOREIGN KEY(user_id) REFERENCES user(id)
);

CREATE TABLE location(
    id INT NOT NULL,
    name VARCHAR(255),
    address VARCHAR(255),
    capacity INT,
    PRIMARY KEY (id)
);

CREATE TABLE event(
    id INT NOT NULL,
    name VARCHAR(255),
    date DATE,
    location_id INT NOT NULL,
    club_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (club_id) REFERENCES club(id)
);

CREATE TABLE participants( -- user and event
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    PRIMARY KEY (user_id, event_id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE review(
    id INT NOT NULL,
    event_id INT NOT NULL,
    author INT NOT NULL,
    review TEXT,
    score ENUM('very bad', 'bad', 'neutral', 'good', 'very good'),
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (author) REFERENCES user(id)
);

CREATE TABLE club_community( -- individual web page of each club
    id INT NOT NULL,
    name TEXT,
    opening_date DATE,
    member INT,
    PRIMARY KEY(id)
);

CREATE TABLE user_and_community( 
    community_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (community_id) REFERENCES club_community(id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    PRIMARY KEY (community_id, user_id)
);

CREATE TABLE post(
    id INT NOT NULL,
    author INT NOT NULL,
    title TEXT,
    content TEXT,
    view INT,
    upvote INT,
    downvote INT,    
    FOREIGN KEY (author) REFERENCES user(id),
    PRIMARY KEY (id)
);

CREATE TABLE host( -- club and event
    club_id INT NOT NULL,
    event_id INT NOT NULL,
    FOREIGN KEY (club_id) REFERENCES club(id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    PRIMARY KEY (club_id, event_id)
); 
