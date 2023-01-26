-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams 
(
id SERIAL PRIMARY KEY,
team_name TEXT NOT NULL,
city TEXT NOT NULL,
stadium TEXT NOT NULL 
);

INSERT INTO teams 
(team_name, city, stadium)
VALUES 
('The Crew', 'Columbus, Oh','Lower.com Field'),
('Sporting KC','Kansas City, Ks','Childrens Mercy Park'),
('The Fire FC', 'Chicago, Il','Soldier Field'),
('United FC', 'Minneapolis, Mn', 'Aliliaz Field'),
('The Timbers', 'Portland, Or','Providence Park'),
('Dynamo FC','Houston, Tx', 'Shell Energy Stadium'),
('The Earthquakes', 'San Jose, Ca','PayPal Park');


CREATE TABLE players 
(
id SERIAL PRIMARY KEY,
plyr_name TEXT NOT NULL,
age INT NOT NULL,
team_id INT NOT NULL,
FOREIGN KEY (team_id) REFERENCES teams(id)
);

INSERT INTO players
(plyr_name, age, team_id)
VALUES
('Cucho Hernandez', 26, 1),
('Lucas Zelarayan', 24, 1),
('Alan Pulido', 31, 2),
('Johnny Russell', 28, 2),
('Jario Torres', 22, 3),
('Kacper Przybyko', 32, 3),
('Luis Amarilla', 25, 4),
('Emanuel Reynoso', 28,4),
('Yimmi Charro', 29,5),
('Darion Asprilla', 26, 5),
('Sebastian Ferreira', 33, 6),
('Griffin Dorsey', 22, 6),
('Cade Crowell', 24,7),
('Cristian Espinoza',28, 7);

CREATE TABLE referees 
(
id SERIAL PRIMARY KEY,
ref_name TEXT NOT NULL,
age INT NOT NULL,
is_active BOOLEAN
);

INSERT INTO referees
(ref_name, age, is_active)
VALUES
('Mike Johnson', 52, 'false'),
('David Rogers', 33, 'true'),
('Steve Davis', 41, 'true'),
('Carl Smith', 46, 'true'),
('Lance Leipold', 63, 'false'),
('Jimmy Nickson', 41, 'true'),
('Bill Pilbert', 50, 'true');


CREATE TABLE seasons 
(
id SERIAL PRIMARY KEY,
season_yr INT NOT NULL,
champion INT NOT NULL,
FOREIGN KEY (champion) REFERENCES teams(id) 
);

INSERT INTO seasons
(season_yr, champion)
VALUES
(2011, 3),
(2012, 1),
(2013, 6),
(2014, 2),
(2015, 3),
(2016, 7),
(2018, 4),
(2019, 4),
(2020, 5),
(2021, 1),
(2022, 3);


CREATE TABLE matches 
(
id SERIAL PRIMARY KEY,
team_one_id INT NOT NULL,
team_two_id INT NOT NULL,
winning_team_id_null_if_draw INT,
head_ref_id INT NOT NULL,
season_id INT NOT NULL,
FOREIGN KEY (team_one_id) REFERENCES teams(id),
FOREIGN KEY (team_two_id) REFERENCES teams(id),
FOREIGN KEY (winning_team_id_null_if_draw) REFERENCES teams(id),
FOREIGN KEY (head_ref_id) REFERENCES referees(id),
FOREIGN KEY (season_id) REFERENCES seasons(id)
);

INSERT INTO matches
(team_one_id, team_two_id, winning_team_id_null_if_draw, head_ref_id, season_id)
VALUES
(4,3,3,2,6),
(1,2,NULL,4,1),
(2,5,5,6,2),
(6,4,NULL,3,9),
(3,7,7,5,4),
(4,1,1,1,1),
(3,6,6,4,7),
(5,7,NULL,5,11),
(1,4,4,6,3),
(6,2,2,2,2);


CREATE TABLE goals 
(
id SERIAL PRIMARY KEY,
match_id INT NOT NULL,
player_id INT NOT NULL,
goal_minute INT NOT NULL,
FOREIGN KEY (match_id) REFERENCES matches(id),
FOREIGN KEY (player_id) REFERENCES players(id) 
);

INSERT INTO goals
(match_id, player_id, goal_minute)
VALUES 
(1, 7, 33),
(1, 6, 41),
(1, 5, 81),
(2, 1, 13),
(2, 3, 74),
(3, 9, 7),
(3, 9, 33),
(3, 9, 61),
(5, 14,26),
(5, 6, 29),
(5, 13, 64),
(6, 1, 13),
(6, 2, 33),
(6, 7, 83);




