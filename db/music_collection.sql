DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
id SERIAL4 PRIMARY KEY,
title VARCHAR(255),
genre VARCHAR(255),
artist_id INT REFERENCES artists(id)
);

--
-- Music Collection
--
-- You have been asked to create an app that will allow a
-- music collector to manage their collection of CDs/records.
--
-- List All Artists/Albums
--
-- List all the albums they have by an artist
--
-- Show the artist any album belongs to
--
-- Every artist should have a name, and each album should
-- have a name/title, genre and artist ID.
--
-- Further tasks
--
-- Additionally it would be nice to be able to:
--
-- Edit Artists/Albums
-- Delete Artists/Albums
-- Find Artists/Albums by their ID
-- Remember to regularly git commit!
