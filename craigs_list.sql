-- from the terminal run:
-- psql < craigs_list.sql

DROP DATABASE IF EXISTS craigs_list;

CREATE DATABASE craigs_list;

\c craigs_list

CREATE TABLE regions 
(
id SERIAL PRIMARY KEY,
region TEXT NOT NULL,   
active_users INT NOT NULL
);

INSERT INTO regions
(region, active_users)
VALUES
('Boston',352543),
('New York', 2123532),
('Atlanta', 543234),
('Miami', 213345),
('Dallas', 412455),
('Kansas City', 134563),
('Denver', 212455),
('Phoenix', 433234),
('Los Angeles', 1234567),
('Seattle', 465332);


CREATE TABLE users 
(
id SERIAL PRIMARY KEY,
username VARCHAR(15) NOT NULL UNIQUE,
is_admin BOOLEAN,
pref_reg INT NOT NULL,
FOREIGN KEY (pref_reg) REFERENCES regions(id)
);

INSERT INTO users
(username, is_admin, pref_reg)
VALUES 
('Catmom7','false',6),
('BillyBoy3','false',2),
('DaveDad1','false',3),
('Dogluver54','false',8),
('Craig','true',2),
('MrsSally','false',10),
('BaconEater8','false',4),
('LakerFan43','false',9),
('TruthSpeeker543','false',1),
('GrandmaBetty','false',5);



CREATE TABLE categories
(
id SERIAL PRIMARY KEY,
category TEXT NOT NULL,
num_posts INT 
);

INSERT INTO categories
(category, num_posts)
VALUES
('jobs',234566743),
('services',34564334),
('community',2235778),
('for sale', 54324565),
('forums', 3445345),
('housing', 6786433),
('groups', 5342235),
('support', 2134456);


CREATE TABLE posts 
(
id SERIAL PRIMARY KEY,
user_id INT NOT NULL,
title VARCHAR(20) NOT NULL,
content TEXT NOT NULL,
category_id INT NOT NULL,
region_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (category_id) REFERENCES categories(id),
FOREIGN KEY (region_id) REFERENCES regions(id)
);

INSERT INTO posts
(user_id, title, content, category_id, region_id)
VALUES
(5,'IM THE BOSS!','Just a reminder that I AM Craig and this is my freaking LIST!',7, 2),
(1, 'CatPics!','Here"s 345 more photos of Princess Kitty!',5,6),
(3,'Tools for sale','Like new toolset $450 text me',4,3),
(8,'Signed Lebron Jersey','Selling my signed Lebron jersey $500 OBO',4,9),
(2,'Looking for work','Hey, Billy here anyone got a job for me?',1,2),
(4,'Dog group meetup','Hey guys reminder of our meetup tonight at 7:pm bring your muts!',4,7),
(6,'Selling my soul!','Highest bidder wins my blackend soul', 4, 10),
(10,'Cookie recipe', 'Hey gang here"s my famous cookie reciepe my grandkids love!',5,5),
(7,'House for rent','House for rent $1400/mon, (smells like bacon)',6,4);






