-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.
INSERT INTO Team (country, national_association, url, group) VALUES
('Argentina', 'Argentine Football Association', 'http://www.afa.org.ar/', 'A'),
('Brazil', 'Brazilian Football Confederation', 'https://www.cbf.com.br/', 'G'),
('Germany', 'German Football Association', 'https://www.dfb.de/', 'E'),
('England', 'The Football Association', 'http://www.thefa.com/', 'B'),
('Spain', 'Royal Spanish Football Federation', 'https://www.rfef.es/', 'E'),
('France', 'French Football Federation', 'https://www.fff.fr/', 'D');

-- Adding players to the Player table

-- Argentina (4 players)
INSERT INTO Player (pid, name, DOB, shirt_number, general_position, country) VALUES
(1010001, 'Lionel Messi', '1987-06-24', 10, 'Forward', 'Argentina'),
(1010002, 'Sergio Aguero', '1988-06-02', 19, 'Forward', 'Argentina'),
(1010003, 'Paulo Dybala', '1993-11-15', 21, 'Forward', 'Argentina'),
(1010004, 'Giovani Lo Celso', '1996-04-09', 20, 'Midfielder', 'Argentina');

-- Brazil (4 players)
INSERT INTO Player (pid, name, DOB, shirt_number, general_position, country) VALUES
(1020001, 'Neymar Jr.', '1992-02-05', 10, 'Forward', 'Brazil'),
(1020002, 'Roberto Firmino', '1991-10-02', 20, 'Forward', 'Brazil'),
(1020003, 'Gabriel Jesus', '1997-04-03', 9, 'Forward', 'Brazil'),
(1020004, 'Casemiro', '1992-02-23', 5, 'Midfielder', 'Brazil');

-- Germany (4 players)
INSERT INTO Player (pid, name, DOB, shirt_number, general_position, country) VALUES
(1030001, 'Manuel Neuer', '1986-03-27', 1, 'Goalkeeper', 'Germany'),
(1030002, 'Toni Kroos', '1990-01-04', 8, 'Midfielder', 'Germany'),
(1030003, 'Thomas Muller', '1989-09-13', 13, 'Forward', 'Germany'),
(1030004, 'Serge Gnabry', '1995-07-14', 20, 'Forward', 'Germany');

-- England (4 players)
INSERT INTO Player (pid, name, DOB, shirt_number, general_position, country) VALUES
(1040001, 'Harry Kane', '1993-07-28', 9, 'Forward', 'England'),
(1040002, 'Raheem Sterling', '1994-12-08', 10, 'Forward', 'England'),
(1040003, 'Jordan Pickford', '1994-03-07', 1, 'Goalkeeper', 'England'),
(1040004, 'Harry Maguire', '1993-03-05', 6, 'Defender', 'England'),
(1040005, 'Ben White','1993-03-05',99,'Forward','England');

-- Spain (4 players)
INSERT INTO Player (pid, name, DOB, shirt_number, general_position, country) VALUES
(1050001, 'Sergio Ramos', '1986-03-30', 15, 'Defender', 'Spain'),
(1050002, 'Sergio Busquets', '1988-07-16', 5, 'Midfielder', 'Spain'),
(1050003, 'Isco', '1992-04-21', 22, 'Midfielder', 'Spain'),
(1050004, 'Alvaro Morata', '1992-10-23', 7, 'Forward', 'Spain');

-- France (2 players)
INSERT INTO Player (pid, name, DOB, shirt_number, general_position, country) VALUES
(9000012, 'Kylian Mbappe', '1998-12-20', 7, 'Forward', 'France'),
(9000013, 'Antoine Griezmann', '1991-03-21', 10, 'Forward', 'France');

-- Argentina coaches
INSERT INTO Coach (cid, name, role, country)
VALUES (10000001, 'Lionel Scaloni', 'Head Coach', 'Argentina'),
       (10000002, 'Roberto Ayala', 'Assistant Coach', 'Argentina'),
       (10000003, 'Walter Samuel', 'Assistant Coach', 'Argentina'),
       (10000004, 'Pablo Aimar', 'Assistant Coach', 'Argentina');

-- Brazil coaches
INSERT INTO Coach (cid, name, role, country)
VALUES (20000001, 'Tite', 'Head Coach', 'Brazil'),
       (20000002, 'Cléber Xavier', 'Assistant Coach', 'Brazil'),
       (20000003, 'Matheus Bachi', 'Assistant Coach', 'Brazil'),
       (20000004, 'Sylvinho', 'Assistant Coach', 'Brazil');

-- Germany coaches
INSERT INTO Coach (cid, name, role, country)
VALUES (30000001, 'Joachim Löw', 'Head Coach', 'Germany'),
       (30000002, 'Marcus Sorg', 'Assistant Coach', 'Germany'),
       (30000003, 'Andreas Köpke', 'Assistant Coach', 'Germany'),
       (30000004, 'Thomas Schneider', 'Assistant Coach', 'Germany');

-- England coaches
INSERT INTO Coach (cid, name, role, country)
VALUES (40000001, 'Gareth Southgate', 'Head Coach', 'England'),
       (40000002, 'Steve Holland', 'Assistant Coach', 'England'),
       (40000003, 'Chris Powell', 'Assistant Coach', 'England'),
       (40000004, 'Martyn Margetson', 'Assistant Coach', 'England');

-- Spain coaches
INSERT INTO Coach (cid, name, role, country)
VALUES (50000001, 'Luis Enrique', 'Head Coach', 'Spain'),
       (50000002, 'Jordi Alba', 'Assistant Coach', 'Spain'),
       (50000003, 'Joaquín Valdés', 'Assistant Coach', 'Spain'),
       (50000004, 'Robert Moreno', 'Assistant Coach', 'Spain');

-- France coaches
INSERT INTO Coach (cid, name, role, country)
VALUES (60000001, 'Didier Deschamps', 'Head Coach', 'France'),
       (60000002, 'Guy Stéphan', 'Assistant Coach', 'France'),
       (60000003, 'Franck Raviot', 'Goalkeeper Coach', 'France'),
       (60000004, 'Patrick Gonfalone', 'Fitness Coach', 'France');

INSERT INTO Stadium (name, location, entrance_info, capacity, parking_info)
VALUES
    ('Khalifa International Stadium', 'Al Rayyan, Qatar', 'Gate 1 and 2', 40000, 'On-site parking available'),
    ('Education City Stadium', 'Al Rayyan, Qatar', 'Gate 1 and 2', 40000, 'On-site parking available'),
    ('Al-Rayyan Stadium', 'Al Wakrah, Qatar', 'Gate 1 and 2', 40000, 'On-site parking available'),
    ('Al-Wakrah Stadium', 'Al Wakrah, Qatar', 'Gate 1 and 2', 60000, 'On-site parking available'),
    ('Lusail Iconic Stadium', 'Lusail, Qatar', 'Gate 1 and 2', 80000, 'On-site parking available');

INSERT INTO Match (identidier, date, time, round, extra_program, availability, match_length, match_name, stadium,h_name,v_name)
VALUES
    (10001, '2023-03-11', '16:00:00', 'Group Round 1', NULL, 5000, 90, 'France vs Argentina', 'Al-Rayyan Stadium','France','Argentina'),
    (10002, '2023-03-12', '16:00:00', 'Group Round 2', NULL, 7500, 90, 'England vs Brazil', 'Al-Wakrah Stadium','England','Brazil'),
    (10003, '2023-03-13', '16:00:00', 'Group Round 3', NULL, 6000, 90, 'Spain vs Germany', 'Education City Stadium','Spain','Germany'),
    (10007, '2023-03-17', '16:00:00', 'Round of 16', NULL, 8000, 90, 'France vs England', 'Lusail Iconic Stadium','France','England'),
    (10008, '2023-03-18', '16:00:00', 'Round of 16', NULL, 6500, 90, 'Brazil vs Germany', 'Al-Rayyan Stadium','Brazil','Germany'),
    (10009, '2023-03-19', '16:00:00', 'Round of 16', NULL, 5000, 90, 'Argentina vs Spain', 'Al-Wakrah Stadium','Argentina','Spain'),
    (10010, '2023-03-20', '16:00:00', 'Round of 16', NULL, 4500, 90, 'France vs Brazil', 'Education City Stadium','France','Brazil'),
    (10011, '2023-03-21', '16:00:00', 'Quarterfinals', NULL, 7000, 90, 'Spain vs England', 'Lusail Iconic Stadium','Spain','England'),
    (10012, '2023-03-22', '16:00:00', 'Quarterfinals', NULL, 5500, 90, 'Germany vs Argentina', 'Al-Rayyan Stadium','Germany','Argentina'),
    (10013, '2023-03-23', '16:00:00', 'Semifinals', NULL, 9000, 90, 'France vs Spain', 'Lusail Iconic Stadium','France','Spain'),
    (10014, '2023-03-24', '16:00:00', 'Semifinals', NULL, 8000, 90, 'Brazil vs Germany', 'Education City Stadium','Brazil','Germany'),
    (10015, '2023-03-25', '16:00:00', 'Final', NULL, 1000, 90, 'France vs Brazil', 'Lusail Iconic Stadium','France','Brazil');

INSERT INTO Match_Player (pid, identidier, attendance, entered_time, left_time, detailed_position_in_game, yellow_card_number, red_card_number)
VALUES
    (1010001, 10001, TRUE, '00:45:00', '01:30:00', 'Forward', 1, 0),
    (1010002, 10001, TRUE, '00:45:00', '01:30:00', 'Midfield', 0, 0),
    (1010004, 10002, TRUE, '00:00:00', '01:15:00', 'Defender', 0, 0),
    (1020001, 10002, FALSE, NULL, NULL, NULL, 0, 0),
    (1020004, 10003, TRUE, '00:30:00', '01:10:00', 'Goalkeeper', 0, 0),
    (1030001, 10003, TRUE, '01:15:00', '01:30:00', 'Midfield', 1, 0),
    (1040001, 10007, FALSE, NULL, NULL, NULL, 0, 0),
    (1040002, 10007, TRUE, '01:10:00', '01:30:00', 'Forward', 0, 0),
    (1040003, 10007, TRUE, '00:00:00', '01:30:00', 'Midfield', 0, 0),
    (1040004, 10007, TRUE, '00:45:00', '01:30:00', 'Defender', 0, 0),
    (1040005, 10007, TRUE, '00:00:00','01:30:00','Forward',0,0);

INSERT INTO Referees (rid, name, year_of_experience, country)
VALUES
    (1001, 'John Smith', 10, 'England'),
    (1002, 'Laura Gonzalez', 5, 'Spain'),
    (1003, 'Maxime Dupont', 7, 'France'),
    (1004, 'Sebastian Silva', 3, 'Argentina'),
    (1005, 'Lena Schmidt', 9, 'Germany'),
    (1006, 'Tomasz Nowak', 4, 'Poland'),
    (1007, 'Antonio Rossi', 6, 'Italy'),
    (1008, 'Niko Kovač', 8, 'Croatia'),
    (1009, 'Alexandra Petrova', 2, 'Russia'),
    (1010, 'Hassan Ali', 1, 'Qatar');

INSERT INTO Referees_assign (identidier, rid, role)
VALUES
    (10001, 1001, 'Head Referee'),
    (10002, 1002, 'Assistant Referee 1'),
    (10002, 1003, 'Assistant Referee 2'),
    (10003, 1004, 'Video Assistant Referee'),
    (10003, 1005, 'Assistant Video Assistant Referee');


INSERT INTO MatchGoals (occurrence, identidier, occurred_time,who_scored, whether_penalty)
VALUES
    (1, 10001, '00:30:00',9000012 ,FALSE),
    (2, 10001, '00:45:00',9000012 ,FALSE),
    (1, 10002, '00:15:00',1040001 ,TRUE),
    (1, 10003, '00:19:23',1030003 ,FALSE),
    (1, 10009, '00:19:33',1010001 ,FALSE);


INSERT INTO Tickets (tid, price, seat_location, ticket_category, ticket_type, identidier)
VALUES
    (111111001, 120.50, 'East Stand, Row A, Seat 1', 1, 'Adult', 10001),
    (111111002, 95.00, 'West Stand, Row H, Seat 15', 2, 'Child', 10001),
    (111111003, 200.00, 'South Stand, Row E, Seat 7', 1, 'VIP', 10001),
    (111112001, 150.00, 'North Stand, Row B, Seat 3', 1, 'Adult', 10002),
    (111112002, 80.00, 'West Stand, Row D, Seat 8', 2, 'Child', 10002),
    (111112003, 250.00, 'East Stand, Row F, Seat 12', 1, 'VIP', 10002);

INSERT INTO Customer (customer_num, name, password, pronoun, sCart_subtotal, ticket_quantity_in_sCart, preferred_language, nationality, live_location, DOB, address, Eaddress, card_num,card_type,security_code,expiration_data)
VALUES
    (888001, 'John Smith', 'password123', 'he/him', 250.00, 2, 'English', 'American', 'New York', '1990-01-01', '123 Main St', 'john.smith@email.com', '1234567890123456','Visa',123,'2025-06-30'),
    (888002, 'Jane Doe', 'password456', 'she/her', 150.00, 1, 'English', 'Canadian', 'Toronto', '1985-05-05', '456 Maple St', 'jane.doe@email.com', '2345678901234567','Visa',456,'2024-05-31'),
    (888022, 'Ahmed Ali', 'password789', 'he/him', 300.00, 3, 'Arabic', 'Qatari', 'Doha', '1995-07-01', '789 Oak St', 'ahmed.ali@email.com', '3456789012345678','Visa',789,'2023-04-30'),
    (888004, 'Maria Garcia', 'passwordabc', 'she/her', 200.00, 2, 'Spanish', 'Mexican', 'Mexico City', '1992-03-15', '234 Elm St', 'maria.garcia@email.com', '4567890123456789','Mastercard',234,'2025-03-31'),
    (888005, 'Alex Kim', 'passworddef', 'he/him', 150.00, 1, 'Korean', 'Korean', 'Seoul', '1998-11-11', '567 Pine St', 'alex.kim@email.com', '5678901234567890','Mastercard',567,'2022-02-28'),
    (888006, 'Fatima Ahmed', 'passwordeg', 'she/her', 400.00, 4, 'Arabic', 'Qatari', 'Doha', '1993-08-20', '789 Maple St', 'fatima.ahmed@email.com', '6789012345678901','Mastercard',890,'2024-01-31');

INSERT INTO MATCH_RESULT(identidier,date,round,h_name,v_name,h_score,v_score)
VALUES
    (10001,'2023-03-11','Group Round1','France','Argentina',2,0),
    (10002,'2023-03-12','Group Round2','England','Brazil',1,3),
    (10003,'2023-03-13','Group Round3','Spain','Germany',4,2),
    (10007,'2023-03-17','Group Round16','France','England',1,0),
    (10008,'2023-03-18','Group Round16','Brazil','Germany',0,0),
    (10009,'2023-03-19','Group Round16','Argentina','Spain',1,0),
    (10010,'2023-03-20','Group Round16','France','Brazil',0,0),
    (10011,'2023-03-21','Group Round16','Spain','England',null,null),
    (10012,'2023-03-22','Quarterfinals','Germany','Argentina',null,null),
    (10013,'2023-03-23','Semifinals','France','Spain',null,null),
    (10014,'2023-03-24','Semifinals','Brazil','Germany',null,null),
    (10015,'2023-03-25','Finals','France','Brazil',null,null);

INSERT INTO GROUP_GOALS(COUNTRY, GOAL_NUM)
VALUES
    ('France',3),
    ('Argentina',1),
    ('England',1),
    ('Spain',5),
    ('Germany',2),
    ('Brazil',3);






