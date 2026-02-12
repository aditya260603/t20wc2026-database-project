CREATE DATABASE t20wc2026db;
USE t20wc2026db;

CREATE TABLE TEAM(
team_id  INT UNSIGNED AUTO_increment PRIMARY KEY,
team_name varchar(25) NOT NULL UNIQUE
);

CREATE TABLE PLAYERS(
player_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
player_name VARCHAR(50) UNIQUE NOT NULL,
team_id int UNSIGNED,
FOREIGN KEY (team_id) REFERENCES TEAM(team_id)
);

CREATE TABLE MATCHES(
match_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
vanue VARCHAR (50) NOT NULL,
match_date DATE,
result VARCHAR(50),
team_id1 int UNSIGNED NOT NULL,
team_id2 int UNSIGNED NOT NULL,
FOREIGN KEY (team_id1) REFERENCES TEAM(team_id),
FOREIGN KEY (team_id2) REFERENCES TEAM(team_id),
CHECK (team_id1 <> team_id2)
);

CREATE TABLE PLAYERSTATS(
stat_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
runs INT NOT NULL DEFAULT 0,
run_out_made INT NOT NULL DEFAULT 0,
balls_delivered INT NOT NULL DEFAULT 0,
wickets INT NOT NULL DEFAULT 0,
balls_faced INT NOT NULL DEFAULT 0,
catches_taken INT NOT NULL DEFAULT 0,
stumpings INT NOT NULL DEFAULT 0,
match_id INT UNSIGNED NOT NULL,
player_id INT UNSIGNED NOT NULL,
FOREIGN KEY (match_id) REFERENCES MATCHES(match_id),
FOREIGN KEY (player_id) REFERENCES PLAYERS(player_id),
UNIQUE (player_id, match_id)
);

-- inserting dummy data into table TEAM
INSERT INTO TEAM(team_name)
VALUES('USA'), ('CANADA'), ('WEST INDIES'), ('PAPUA NEW GUINEA'), ('SCOTLAND'), ('NAMIBIA'), ('IRELAND'), ('AFGHANISTAN'), ('NEW ZEALAND');

SELECT * FROM TEAM;

-- inserting data into table PLAYERS
INSERT INTO PLAYERS(player_name, team_id)
VALUES('Monank Patel', 1), ('Aaron Jones', 1), ('Nitish Kumar', 1), ('Steven Taylor', 1), ('Shayan Jahangir', 1), ('Corey Anderson', 1), ('Milind Kumar', 1), ('Nisarg Patel', 1), ('Shadley van Schalkwyk',1),
('Andries Gous', 1), ('Ali Khan', 1), ('Harmeet Singh',1), ('Jessy Singh', 1), ('Noshtush Kenjige', 1), ('Saurabh Netravalkar', 1);

INSERT INTO PLAYERS(player_name, team_id)
VALUES ('Saad Bin Zafar', 2), ('Aaron Johnson', 2), ('Dilon Heyliger', 2), ('Dilpreet Bajwa', 2), ('Harsh Thaker', 2), ('Jeremy Gordon', 2), ('Junaid Siddique', 2),
 ('Kaleem Sana', 2), ('Kanwarpal Tathgur', 2), ('Navneet Dhaliwal', 2), ('Nicholas Kirton', 2), ('Pargat Singh', 2), ('Ravinderpal Singh', 2), ('Rayyankhan Pathan', 2), ('Shreyas Movva', 2);

INSERT INTO PLAYERS(player_name, team_id)
VALUES ('Rovman Powell', 3), ('Nicholas Pooran', 3), ('Shai Hope', 3), ('Brandon King', 3), ('Johnson Charles', 3), ('Sherfane Rutherford', 3), ('Andre Russell', 3),
('Jason Holder', 3), ('Romario Shepherd', 3), ('Akeal Hosein', 3), ('Gudakesh Motie', 3), ('Alzarri Joseph', 3), ('Obed McCoy', 3), ('Oshane Thomas', 3), ('Roston Chase', 3);

INSERT INTO PLAYERS(player_name, team_id)
VALUES ('Assad Vala', 4), ('Charles Amini', 4), ('Tony Ura', 4), ('Sese Bau', 4), ('Lega Siaka', 4), ('Hiri Hiri', 4), ('Kiplin Doriga', 4), ('Alei Nao', 4), 
('Kabua Morea', 4), ('Norman Vanua', 4), ('Chad Soper', 4), ('Nosaina Pokana', 4), ('Damien Ravu', 4), ('John Kariko', 4), ('Jack Gardner', 4);

INSERT INTO PLAYERS(player_name, team_id)
VALUES ('Richie Berrington', 5), ('Matthew Cross', 5), ('George Munsey', 5), ('Michael Jones', 5), ('Brandon McMullen', 5), ('Chris Greaves', 5), ('Mark Watt', 5), ('Safyaan Sharif', 5), 
('Brad Wheal', 5), ('Josh Davey', 5), ('Alasdair Evans', 5), ('Michael Leask', 5), ('Hamza Tahir', 5), ('Chris Sole', 5), ('Tom Mackintosh', 5);

INSERT INTO PLAYERS(player_name, team_id)
VALUES ('Gerhard Erasmus', 6), ('JJ Smit', 6), ('Jan Frylinck', 6), ('David Wiese', 6), ('Michael van Lingen', 6), ('Stephan Baard', 6), ('Zane Green', 6), 
('JP Kotze', 6), ('Nicol Loftie-Eaton', 6), ('Bernard Scholtz', 6), ('Ruben Trumpelmann', 6), ('Tangeni Lungameni', 6), ('Ben Shikongo', 6), ('Malan Kruger', 6), ('Shaun Fouche', 6);

INSERT INTO PLAYERS(player_name, team_id)
VALUES ('Paul Stirling', 7), ('Andrew Balbirnie', 7), ('Harry Tector', 7), ('Lorcan Tucker', 7), ('George Dockrell', 7), ('Curtis Campher', 7), ('Mark Adair', 7), 
('Barry McCarthy', 7), ('Josh Little', 7), ('Ben White', 7), ('Gareth Delany', 7), ('Craig Young', 7), ('Andy McBrine', 7), ('Ross Adair', 7), ('Stephen Doheny', 7);

INSERT INTO PLAYERS(player_name, team_id)
VALUES ('Rashid Khan', 8), ('Mohammad Nabi', 8),  ('Rahmanullah Gurbaz', 8), ('Ibrahim Zadran', 8), ('Najibullah Zadran', 8), ('Azmatullah Omarzai', 8), ('Mujeeb Ur Rahman', 8), 
('Noor Ahmad', 8), ('Naveen-ul-Haq', 8), ('Fazalhaq Farooqi', 8), ('Karim Janat', 8), ('Gulbadin Naib', 8), ('Qais Ahmad', 8), ('Zahir Khan', 8), ('Ikram Alikhil', 8);

INSERT INTO PLAYERS(player_name, team_id)
VALUES ('Kane Williamson', 9), ('Devon Conway', 9), ('Finn Allen', 9), ('Rachin Ravindra', 9), ('Daryl Mitchell', 9), ('Glenn Phillips', 9), ('Mark Chapman', 9), ('Mitchell Santner', 9),
('Tim Southee', 9), ('Trent Boult', 9), ('Lockie Ferguson', 9), ('Matt Henry', 9), ('Ish Sodhi', 9), ('Adam Milne', 9), ('Jimmy Neesham', 9);

SELECT * FROM PLAYERS;
-- Inserting matches data...
INSERT INTO MATCHES(vanue, match_date, result, team_id1, team_id2)
VALUES ('Dallas', '2024-06-02', 'USA won by 7 wickets', 1, 2);

INSERT INTO MATCHES(vanue, match_date, result, team_id1, team_id2)
VALUES ('Providence', '2024-06-02', 'West Indies won by 5 wickets', 3, 4);

INSERT INTO MATCHES(vanue, match_date, result, team_id1, team_id2)
VALUES ('Bridgetown', '2024-06-07', 'Scotland won', 5, 6);

INSERT INTO MATCHES(vanue, match_date, result, team_id1, team_id2)
VALUES ('New York', '2024-06-07', 'Canada won by 12 runs', 2, 7);

INSERT INTO MATCHES(vanue, match_date, result, team_id1, team_id2)
VALUES ('Providence', '2024-06-08', 'AFG won by 84 runs', 8, 9);

SELECT * FROM MATCHES;

-- Inserting data into player stats
INSERT INTO PLAYERSTATS(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES
(45, 32, 0, 0, 1, 0, 0, 1, 1),   -- Monank Patel
(36, 28, 0, 0, 0, 0, 0, 1, 2),   -- Aaron Jones
(0, 0, 24, 2, 0, 0, 0, 1, 11),  -- Ali Khan
(22, 0, 18, 1, 15, 0, 0, 1, 6),  -- Corey Anderson
(5,  0, 12, 1, 6,  1, 0, 1, 8);  -- Nisarg Patel

INSERT INTO PLAYERSTATS (runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES
(68, 0, 0, 0, 40, 1, 0, 2, 31),  -- Nicholas Pooran
(42, 0, 0, 0, 28, 0, 0, 2, 30),  -- Rovman Powell
(10, 0, 24, 3, 8,  1, 0, 2, 38), -- Akeal Hosein
(5,  0, 24, 2, 6,  0, 0, 2, 40), -- Alzarri Joseph
(15, 0, 18, 1, 12, 0, 0, 2, 33); -- Andre Russell

INSERT INTO PLAYERSTATS (runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES
(55, 0, 0, 0, 38, 1, 0, 3, 61),  -- George Munsey
(33, 0, 0, 0, 25, 0, 0, 3, 57),  -- Richie Berrington
(8,  0, 24, 2, 6,  1, 0, 3, 66), -- Mark Watt
(4,  0, 24, 3, 5,  0, 0, 3, 71), -- Ruben Trumpelmann
(18, 0, 18, 1, 14, 0, 0, 3, 62); -- Matthew Cross

INSERT INTO PLAYERSTATS (runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES
(48, 0, 0, 0, 34, 1, 0, 4, 26),  -- Nicholas Kirton (Canada)
(31, 0, 0, 0, 22, 0, 0, 4, 20),  -- Navneet Dhaliwal (Canada)
(14, 0, 24, 2, 10, 1, 0, 4, 18), -- Saad Bin Zafar (Canada)
(55, 0, 0, 0, 37, 0, 0, 4, 91),  -- Paul Stirling (Ireland)
(27, 0, 18, 1, 19, 0, 0, 4, 96); -- Curtis Campher (Ireland)

INSERT INTO PLAYERSTATS (runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES
(72, 0, 0, 0, 46, 1, 0, 5, 108), -- Rahmanullah Gurbaz (AFG)
(39, 0, 0, 0, 30, 0, 0, 5, 106), -- Rashid Khan (AFG)
(8,  0, 24, 3, 6,  1, 0, 5, 113), -- Fazalhaq Farooqi (AFG)
(61, 0, 0, 0, 42, 0, 0, 5, 121), -- Kane Williamson (NZ)
(4,  0, 24, 2, 5,  0, 0, 5, 129); -- Trent Boult (NZ)





-- COMMANDS WE RUN FREQUENTLY
SELECT * FROM PLAYERSTATS;

-- modifying structure little bit 
ALTER TABLE playerstats MODIFY COLUMN player_id INT UNSIGNED NOT NULL AFTER stat_id;
ALTER TABLE playerstats MODIFY COLUMN match_id INT UNSIGNED NOT NULL AFTER player_id;


SELECT * FROM MATCHES;
SELECT * FROM TEAM;
SELECT * FROM PLAYERS;

DROP TABLE PLAYERSTATS;
DROP TABLE MATCHES;
DROP TABLE PLAYERS;
DROP TABLE TEAM;

-- Queries to retrive data
-- top run scorer
SELECT players.player_name, SUM(playerstats.runs) AS total_runs
FROM playerstats
JOIN players on playerstats.player_id = players.player_id
GROUP BY playerstats.player_id
ORDER BY total_runs DESC
LIMIT 1;

-- top 5 run scorrers 
SELECT players.player_name, SUM(playerstats.runs) AS total_runs
FROM playerstats
JOIN players on playerstats.player_id = players.player_id
GROUP BY playerstats.player_id
ORDER BY total_runs DESC
LIMIT 5;

-- top wicket taker
SELECT players.player_name, SUM(playerstats.wickets) AS total_wickets
FROM playerstats
JOIN players on playerstats.player_id = players.player_id
GROUP BY playerstats.player_id
ORDER BY total_wickets DESC
LIMIT 1;

-- TOP 5 WICKET TAKERS
SELECT players.player_name, SUM(playerstats.wickets) AS total_wickets
FROM playerstats
JOIN players on playerstats.player_id = players.player_id
GROUP BY playerstats.player_id
ORDER BY total_wickets DESC
LIMIT 5;
 
-- highest strike rate in batting
SELECT players.player_name, 
SUM(playerstats.runs) as total_runs, 
SUM(playerstats.balls_faced) as total_balls_faced
FROM playerstats join players on playerstats.player_id = players.player_id
GROUP BY players.player_name;

SELECT players.player_name,
(SUM(playerstats.runs)/SUM(playerstats.balls_faced)) * 100 AS batting_strike_rate
FROM playerstats JOIN players ON playerstats.player_id = players.player_id
GROUP BY players.player_name;

-- Highest strike rate in bowling
SELECT players.player_name,
SUM(playerstats.balls_delivered) as balls_delivered,
SUM(playerstats.wickets) as total_wickets
FROM playerstats JOIN players on playerstats.player_id = players.player_id
GROUP BY players.player_name;

SELECT players.player_name,
(SUM(playerstats.balls_delivered)/SUM(playerstats.wickets)) AS bowling_strike_rate
FROM playerstats JOIN players ON playerstats.player_id = players.player_id
GROUP BY players.player_name;

-- truncate all the data 
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE PLAYERSTATS;
TRUNCATE TABLE MATCHES;
TRUNCATE TABLE PLAYERS;
TRUNCATE TABLE TEAM;

SET FOREIGN_KEY_CHECKS = 1;

-- checking if the values are deleted or not 
select * from team;
select * from playerstats;
select * from players;
select * from matches;

-- Adding data of 2026 t20 wc
-- Adding data in table team
INSERT INTO TEAM(team_name)
VALUES ('Netherlands'), ('Pakistan'), ('West Indies'), ('Scotland'), ('India'), ('USA'), ('Afghanistan'), ('New Zealand'), ('England'), ('Nepal');
select * from team;

INSERT INTO PLAYERS(player_name, team_id)
VALUES ('Scott Edwards', 1), ('Max O''Dowd', 1), ('Bas de Leede', 1), ('Logan van Beek', 1), ('Vikramjit Singh', 1), ('Colin Ackermann', 1),
 ('Teja Nidamanuru', 1), ('Roelof van der Merwe', 1), ('Aryan Dutt', 1), ('Paul van Meekeren', 1), ('Fred Klaassen', 1);

INSERT INTO PLAYERS (player_name, team_id)
VALUES ('Sahibzada Farhan', 2), ('Saim Ayub', 2), ('Agha Salman', 2), ('Babar Azam', 2), ('Usman Khan', 2), ('Shadab Khan', 2),
 ('Mohammad Nawaz', 2), ('Fahim Ashraf', 2), ('Shaheen Afridi', 2), ('Salman Mirza', 2), ('Abrar Ahmad', 2);

INSERT INTO PLAYERS (player_name, team_id)
VALUES ('Brandon King', 3), ('Shai Hope', 3), ('Shimron Hetmyer', 3), ('Rovman Powell', 3), ('Sherfane Rutherford', 3),
 ('Jason Holder', 3), ('Romario Shepherd', 3), ('Akeal Hosein', 3), ('Gudakesh Motie', 3), ('Matthew Forde', 3), ('Shamar Joseph', 3);
 
INSERT INTO PLAYERS (player_name, team_id) 
VALUES ('George Munsey', 4), ('Matthew Cross', 4), ('Brandon McMullen', 4), ('Michael Jones', 4), ('Tom Bruce', 4),
 ('Richie Berrington', 4), ('Michael Leask', 4), ('Mark Watt', 4), ('Safyaan Sharif', 4), ('Brad Currie', 4), ('Oliver Davidson', 4);

INSERT INTO PLAYERS (player_name, team_id) 
VALUES  ('Abhishek Sharma', 5),  ('Ishan Kishan', 5),  ('Tilak Varma', 5),  ('Suryakumar Yadav', 5),  ('Rinku Singh', 5),  
('Hardik Pandya', 5),  ('Shivam Dube', 5),  ('Axar Patel', 5),  ('Arshdeep Singh', 5),  ('Mohammed Siraj', 5),  ('Varun Chakaravarthy', 5);

INSERT INTO PLAYERS (player_name, team_id) 
VALUES ('Steven Taylor', 6),  ('Andries Gous', 6),  ('Monank Patel', 6),  ('Aaron Jones', 6),  ('Smit Patel', 6), 
 ('Shayan Jahangir', 6),  ('Corey Anderson', 6),  ('Harmeet Singh', 6),  ('Jasdeep Singh', 6),  ('Saurabh Netravalkar', 6),  ('Nosthush Kenjige', 6);
 
 INSERT INTO PLAYERS (player_name, team_id) 
VALUES ('Rahmanullah Gurbaz', 7), ('Ibrahim Zadran', 7), ('Sediqullah Atal', 7),  ('Darwish Rasooli', 7), ('Azmatullah Omarzai', 7),  
('Gulbadin Naib', 7),  ('Mohammad Nabi', 7),  ('Rashid Khan', 7),  ('Fazalhaq Farooqi', 7),  ('Mujeeb Ur Rahman', 7),  ('Ziaur Rahman Sharifi', 7);

INSERT INTO PLAYERS (player_name, team_id) 
VALUES ('Finn Allen', 8), ('Tim Seifert', 8), ('Rachin Ravindra', 8), ('Glenn Phillips', 8),  ('Mark Chapman', 8), 
 ('Daryl Mitchell', 8),  ('Mitchell Santner', 8),  ('James Neesham', 8),  ('Matt Henry', 8),  ('Lockie Ferguson', 8),  ('Jacob Duffy', 8);
 
INSERT INTO PLAYERS (player_name, team_id) 
VALUES ('Phil Salt', 9), ('Jos Buttler', 9), ('Jacob Bethell', 9), ('Tom Banton', 9), ('Harry Brook', 9), ('Sam Curran', 9),
 ('Will Jacks', 9), ('Liam Dawson', 9), ('Jofra Archer', 9), ('Adil Rashid', 9), ('Luke Wood', 9);

INSERT INTO PLAYERS (player_name, team_id)
VALUES ('Kushal Bhurtel', 10), ('Aasif Sheikh', 10), ('Rohit Paudel', 10), ('Dipendra Singh Airee', 10), ('Aarif Sheikh', 10), 
('Lokesh Bam', 10), ('Gulshan Jha', 10), ('Karan KC', 10), ('Sandeep Lamichhane', 10), ('Nandan Yadav', 10), ('Sher Mall', 10);


-- inserting matches data
INSERT INTO MATCHES(vanue, match_date, result, team_id1, team_id2)
VALUES ('Sinhali Sports Club Cricket Ground', '2026-02-07', 'Pakistan won by 3 wickets (3 Balls Left)', 1, 2);

INSERT INTO MATCHES(vanue, match_date, result, team_id1, team_id2)
VALUES ('Eden Garden, Kolkata', '2026-02-07', 'West Indies won by 35 runs', 3, 4);

INSERT INTO MATCHES(vanue, match_date, result, team_id1, team_id2)
VALUES ('Wankhede Stadiun, Mumbai', '2026-02-07', 'India won by 29 runs', 5, 6);

INSERT INTO MATCHES(vanue, match_date, result, team_id1, team_id2)
VALUES ('MA Chidambaram Stadium,chennai', '2026-02-08', 'NZ won by 5 wickets (13 balls left)', 7, 8);

INSERT INTO MATCHES(vanue, match_date, result, team_id1, team_id2)
VALUES ('Wankhede Stadiun, Mumbai', '2026-02-08', 'ENG won by 4 runs', 9, 10);

-- Inserting data in playerstats
INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(37, 0, 0, 0, 29, 2, 0, 1, 1);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(5, 0, 0, 0, 7, 0, 0, 1, 2);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(24, 0, 24, 2, 18, 1, 0, 1, 3);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(12, 0, 24, 3, 10, 0, 2, 1, 4);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(22, 0, 0, 0, 20, 1, 0, 1, 5);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(11, 0, 12, 1, 13, 0, 0, 1, 6);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(15, 0, 0, 0, 14, 0, 0, 1, 7);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(8, 0, 24, 1, 9, 0, 0, 1, 8);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(4, 0, 24, 0, 5, 1, 0, 1, 9);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(7, 0, 24, 0, 5, 0, 0, 1, 10);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(2, 0, 24, 0, 4, 0, 0, 1, 11);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(47, 0, 0, 0, 31, 2, 0, 1, 12);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(24, 0, 6, 2, 13, 0, 0, 1, 13);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(12, 0, 0, 0, 8, 2, 1, 1, 14);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(15, 0, 0, 0, 18, 1, 0, 1, 15);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(0, 0, 0, 0, 2, 2, 0, 1, 16);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(8, 0, 24, 0, 12, 0, 0, 1, 17);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(2, 0, 18, 1, 4, 1, 0, 1, 18);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(29, 0, 24, 2, 21, 1, 0, 1, 19);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(5, 0, 24, 2, 6, 0, 0, 1, 20);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(0, 0, 23, 3, 0, 0, 0, 1, 21);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(0, 0, 24, 2, 0, 1, 0, 1, 22);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(35, 0, 0, 0, 30, 0, 0, 2, 23);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id) 
VALUES(19, 1, 0, 0, 18, 1, 1, 2, 24);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(64, 4, 0, 0, 36, 1, 0, 2, 25);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(24, 2, 0, 0, 18, 1, 0, 2, 26);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(26, 3, 0, 0, 13, 2, 0, 2, 27);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(1, 0, 30, 3, 2, 1, 0, 2, 28);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 20, 5, 0, 3, 0, 2, 29);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 26, 0, 0, 0, 0, 2, 30);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 29, 1, 0, 0, 0, 2, 31);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(1, 0, 15, 0, 2, 0, 0, 2, 32);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 26, 1, 0, 1, 0, 2, 33);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(19, 0, 0, 0, 15, 0, 0, 2, 34);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(11, 0, 0, 0, 11, 0, 0, 2, 35);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(14, 0, 0, 0, 12, 1, 1, 2, 36);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(1, 0, 0, 0, 5, 1, 0, 2, 37);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(35, 0, 0, 0, 28, 0, 0, 2, 38);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(42, 0, 0, 0, 24, 0, 0, 2, 39);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 24, 1, 1, 0, 0, 2, 40);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(11, 0, 24, 0, 12, 0, 0, 2, 41);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 18, 1, 1, 0, 0, 2, 42);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(2, 0, 24, 2, 3, 0, 0, 2, 43);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 18, 1, 1, 0, 0, 2, 44);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 0, 0, 1, 0, 0, 3, 45);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(20, 0, 0, 0, 16, 0, 2, 3, 46);

INSERT INTO PLAYERSTATS 
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(25, 0, 0, 0, 16, 2, 0, 3, 47);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(84, 0, 0, 0, 49, 0, 0, 3, 48);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(6, 0, 0, 0, 14, 1, 0, 3, 49);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(5, 0, 24, 0, 6, 2, 0, 3, 50);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 0, 0, 1, 1, 0, 3, 51);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(14, 0, 24, 2, 11, 0, 0, 3, 52);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(4, 0, 24, 2, 6, 1, 0, 3, 53);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 24, 3, 0, 1, 0, 3, 54);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 24, 1, 0, 2, 0, 3, 55);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 0, 0, 0, 3, 0, 3,  56);     

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(6, 0, 0, 0, 9, 1, 0, 3,  57);   

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 0, 0, 2, 1, 0, 3,  58);   

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 0, 0, 0, 1, 0, 3,  59);   

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 0, 0, 0, 0, 2, 3,  60);  

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 0, 0, 0, 1, 0, 3,  61);   

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 0, 0, 0, 2, 0, 3,  62);   

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(8, 0, 24, 2, 9, 2, 0, 3,  63);  

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 0, 0, 0, 2, 0, 3,  64);   

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 24, 0, 0, 1, 0, 3,  65);  

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 0, 0, 0, 1, 0, 3,  66);  

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(27, 0, 0, 0, 22, 0, 0, 4, 67);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(10, 0, 0, 0, 12, 2, 0, 4, 68);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(63, 0, 0, 0, 35, 1, 0, 4, 69);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(29, 0, 0, 0, 24, 1, 2, 4, 70);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(20, 0, 0, 0, 13, 2, 0, 4, 71);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(14, 0, 0, 0, 7, 1, 0, 4, 72);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(10, 0, 0, 0, 7, 2, 0, 4, 73);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(12, 0, 0, 0, 10, 1, 0, 4, 74);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(25, 0, 0, 0, 18,10, 0, 4, 75);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(8, 0, 0, 0, 7, 0, 0, 4, 76);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(41, 0, 0, 0, 30, 1, 0, 4, 77);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(19, 0, 0, 0, 15, 0, 0, 4, 78);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(6, 0, 0, 0, 5, 3, 0, 4, 79);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 24, 2, 0, 0, 2, 4, 80);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(3, 0, 24, 1, 4, 0, 0, 4, 81);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 18, 0, 0, 1, 0, 4, 82);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(5, 0, 12, 1, 6, 0, 0, 4, 83);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 24, 3, 0, 2, 0, 4, 84);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(14, 0, 0, 0, 11, 0, 0, 4, 85);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(27, 0, 0, 0, 20, 1, 0, 4, 86);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(9, 0, 24, 1, 8, 0, 0, 4, 87);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 24, 2, 0, 2, 0, 4, 88);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(16, 0, 0, 0, 12, 0, 0, 5, 89);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(22, 0, 0, 0, 17, 0, 3, 5, 90);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(4, 0, 12, 1, 3, 3, 0, 5, 91);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 24, 0, 0, 2, 0, 5, 92);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(31, 0, 0, 0, 23, 1, 0, 5, 93);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(18, 0, 0, 0, 14, 1, 0, 5, 94);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(7, 0, 6, 1, 5, 0, 0, 5, 95);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 24, 2, 0, 0, 0, 5, 96);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(11, 0, 0, 0, 9, 2, 0, 5, 97);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(24, 0, 0, 0, 18, 0, 0, 5, 98);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 18, 1, 0, 0, 0, 5, 99);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(5, 0, 24, 2, 6, 2, 0, 5, 100);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(13, 0, 0, 0, 10, 0, 0, 5, 101);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 24, 3, 0, 1, 0, 5, 102);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(19, 0, 0, 0, 14, 0, 0, 5, 103);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 24, 1, 0, 3, 0, 5, 104);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(21, 0, 0, 0, 16, 0, 1, 5, 105);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(2, 0, 6, 1, 2, 0, 0, 5, 106);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 24, 2, 0, 1, 0, 5, 107);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(17, 0, 0, 0, 13, 0, 0, 5, 108);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(0, 0, 18, 1, 0, 0, 0, 5, 109);

INSERT INTO PLAYERSTATS
(runs, run_out_made, balls_delivered, wickets, balls_faced, catches_taken, stumpings, match_id, player_id)
VALUES(9, 0, 0, 0, 7, 1, 0, 5, 110);

-- Queries to test the database
select * from team;
select * from playerstats;
select * from players;
select * from matches;

SELECT players.player_name, SUM(playerstats.runs) AS total_runs
FROM playerstats
JOIN players on playerstats.player_id = players.player_id
GROUP BY playerstats.player_id
ORDER BY total_runs DESC
LIMIT 1;

-- top 5 run scorrers 
SELECT players.player_name, SUM(playerstats.runs) AS total_runs
FROM playerstats
JOIN players on playerstats.player_id = players.player_id
GROUP BY playerstats.player_id
ORDER BY total_runs DESC
LIMIT 5;

-- top wicket taker
SELECT players.player_name, SUM(playerstats.wickets) AS total_wickets
FROM playerstats
JOIN players on playerstats.player_id = players.player_id
GROUP BY playerstats.player_id
ORDER BY total_wickets DESC
LIMIT 1;

-- TOP 5 WICKET TAKERS
SELECT players.player_name, SUM(playerstats.wickets) AS total_wickets
FROM playerstats
JOIN players on playerstats.player_id = players.player_id
GROUP BY playerstats.player_id
ORDER BY total_wickets DESC
LIMIT 5;
 
-- highest strike rate in batting
SELECT players.player_name, 
SUM(playerstats.runs) as total_runs, 
SUM(playerstats.balls_faced) as total_balls_faced
FROM playerstats join players on playerstats.player_id = players.player_id
GROUP BY players.player_name;

SELECT players.player_name,
(SUM(playerstats.runs)/SUM(playerstats.balls_faced)) * 100 AS batting_strike_rate
FROM playerstats JOIN players ON playerstats.player_id = players.player_id
GROUP BY players.player_name;

-- Highest strike rate in bowling
SELECT players.player_name,
SUM(playerstats.balls_delivered) as balls_delivered,
SUM(playerstats.wickets) as total_wickets
FROM playerstats JOIN players on playerstats.player_id = players.player_id
GROUP BY players.player_name;

SELECT players.player_name,
(SUM(playerstats.balls_delivered)/SUM(playerstats.wickets)) AS bowling_strike_rate
FROM playerstats JOIN players ON playerstats.player_id = players.player_id
GROUP BY players.player_name
LIMIT 1 ;

