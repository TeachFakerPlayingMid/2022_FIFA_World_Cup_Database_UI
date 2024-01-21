-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.


CREATE TABLE Team
(
    country VARCHAR(30) NOT NULL ,
    PRIMARY KEY (country),
    national_association VARCHAR(50) NOT NULL,
    url VARCHAR(100) NOT NULL ,
    group VARCHAR(1) NOT NULL
);

CREATE TABLE Player
(
    pid INTEGER NOT NULL ,
    PRIMARY KEY (pid),
    name VARCHAR(30) NOT NULL ,
    DOB DATE NOT NULL,
    shirt_number INTEGER NOT NULL ,
    general_position VARCHAR(10) NOT NULL,
    country VARCHAR(30) NOT NULL,
    FOREIGN KEY(country) REFERENCES Team(country)
);

CREATE TABLE Coach
(
    cid INTEGER NOT NULL ,
    PRIMARY KEY (cid) ,
    name VARCHAR(30) NOT NULL ,
    role VARCHAR(30),
    country VARCHAR(30) NOT NULL,
    FOREIGN KEY(country) REFERENCES Team(country)
);

CREATE TABLE Stadium
(
    name VARCHAR(50) NOT NULL ,
    PRIMARY KEY (name),
    location VARCHAR(50) NOT NULL,
    entrance_info VARCHAR(50),
    capacity INTEGER NOT NULL ,
    parking_info VARCHAR(50)
);

CREATE TABLE Match
(
    identidier INTEGER NOT NULL ,
    PRIMARY KEY (identidier),
    date DATE NOT NULL ,
    time TIME NOT NULL ,
    round VARCHAR(30),
    extra_program VARCHAR(30),
    availability INTEGER,
    match_length INTEGER NOT NULL ,
    match_name VARCHAR(50),
    stadium VARCHAR(50),
    FOREIGN KEY (stadium) REFERENCES Stadium(name),
    h_name VARCHAR(30) NOT NULL ,
    v_name VARCHAR(30) NOT NULL
);

CREATE TABLE Match_Player
(
    pid INTEGER NOT NULL ,
    identidier INTEGER NOT NULL ,
    PRIMARY KEY (pid,identidier),
    attendance BOOLEAN NOT NULL ,
    entered_time TIME  ,
    left_time TIME  ,
    detailed_position_in_game VARCHAR(10) ,
    yellow_card_number INTEGER NOT NULL ,
    red_card_number INTEGER NOT NULL ,
    FOREIGN KEY (pid) REFERENCES Player(pid),
    FOREIGN KEY (identidier) REFERENCES Match(identidier)
);

CREATE TABLE Referees
(
    rid INTEGER NOT NULL ,
    PRIMARY KEY (rid),
    name VARCHAR(30) NOT NULL ,
    year_of_experience INTEGER NOT NULL ,
    country VARCHAR(30) NOT NULL
);

CREATE TABLE Referees_assign
(
    identidier INTEGER NOT NULL ,
    rid INTEGER NOT NULL ,
    PRIMARY KEY (rid,identidier),
    role VARCHAR(50) NOT NULL ,
    FOREIGN KEY(identidier) REFERENCES Match(identidier),
    FOREIGN KEY(rid) REFERENCES Referees(rid)
);

CREATE TABLE MatchGoals
(
    occurrence INTEGER NOT NULL ,
    identidier INTEGER NOT NULL ,
    PRIMARY KEY (identidier,occurrence),
    occurred_time TIME NOT NULL ,
    who_scored INTEGER NOT NULL ,
    FOREIGN KEY (who_scored) REFERENCES Player(pid),
    whether_penalty BOOLEAN NOT NULL,
    FOREIGN KEY (identidier) REFERENCES Match(identidier)
);

CREATE TABLE Tickets
(
    tid INTEGER NOT NULL ,
    PRIMARY KEY (tid),
    price FLOAT NOT NULL ,
    seat_location VARCHAR(50) NOT NULL ,
    ticket_category INTEGER NOT NULL ,
    ticket_type VARCHAR(10) NOT NULL ,
    identidier INTEGER NOT NULL ,
    FOREIGN KEY (identidier) REFERENCES Match (identidier)
);


CREATE TABLE Customer
(
    customer_num INTEGER NOT NULL ,
    PRIMARY KEY (customer_num),
    name VARCHAR(30) NOT NULL ,
    password VARCHAR(15) NOT NULL ,
    pronoun VARCHAR(10) NOT NULL ,
    sCart_subtotal FLOAT NOT NULL ,
    ticket_quantity_in_sCart INTEGER NOT NULL ,
    preferred_language VARCHAR(30) NOT NULL ,
    nationality VARCHAR(30) NOT NULL ,
    live_location VARCHAR(50) NOT NULL ,
    DOB DATE NOT NULL ,
    address VARCHAR(50) NOT NULL ,
    Eaddress VARCHAR(30) NOT NULL ,
    card_num VARCHAR(50) ,
    card_type VARCHAR(10) ,
    security_code INTEGER,
    expiration_data DATE
);

CREATE TABLE MATCH_RESULT
(
    identidier INTEGER NOT NULL ,
    PRIMARY KEY (identidier),
    FOREIGN KEY(identidier) REFERENCES Match(identidier),
    date DATE NOT NULL ,
    round VARCHAR(30),
    h_name VARCHAR(30) NOT NULL ,
    v_name VARCHAR(30) NOT NULL ,
    h_score INT,
    v_score  INT
);

CREATE TABLE GROUP_GOALS
(
    COUNTRY VARCHAR(30) NOT NULL ,
    PRIMARY KEY (COUNTRY),
    GOAL_NUM INTEGER NOT NULL

);


