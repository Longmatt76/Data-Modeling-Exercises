-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL UNIQUE
);

INSERT INTO artists
(artist_name)
VALUES
('Hanson'),
('Queen'),
('Mariah Cary'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('JayZ'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny"s Child');


CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL UNIQUE
);

INSERT INTO producers
(producer_name)
VALUES
('DUST BROTHERS'),
('Stephan Leroni'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parasher'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');



CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975', 'A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995', 'Daydream'),
  ('Shallow', 216, '09-27-2018',  'A Star Is Born'),
  ('How You Remind Me', 223, '08-21-2001', 'Silver Side Up'),
  ('New York State of Mind', 276, '10-20-2009', 'The Blueprint 3'),
  ('Dark Horse', 215, '12-17-2013',  'Prism'),
  ('Moves Like Jagger', 201, '06-21-2011', 'Hands All Over'),
  ('Complicated', 244, '05-14-2002',  'Let Go'),
  ('Say My Name', 240, '11-07-1999',  'The Writing''s on the Wall');


CREATE TABLE collaborations
(
  id SERIAL PRIMARY KEY,
  song_id INT NOT NULL,
  artist_id INT NOT NULL,
  producer_id INT NOT NULL,
  FOREIGN KEY (song_id) REFERENCES songs(id),
  FOREIGN KEY (artist_id) REFERENCES artists(id),
  FOREIGN KEY (producer_id) REFERENCES producers(id)
);

INSERT INTO collaborations
(song_id, artist_id, producer_id)
VALUES
(2,2,5),
(1,5,6),
(4,5,7),
(3,6,8),
(6,3,5),
(7,6,4),
(2,2,6);



