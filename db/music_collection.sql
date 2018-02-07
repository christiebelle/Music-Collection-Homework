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
-- List all the albums they have by an artist
--
-- Show the artist any album belongs to
--
-- Further tasks
--
-- Additionally it would be nice to be able to:
--
-- Edit Artists/Albums
-- Delete Artists/Albums
-- Find Artists/Albums by their ID
-- Remember to regularly git commit!
