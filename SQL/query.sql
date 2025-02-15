USE spotify_db;

#---Create Table---
DROP TABLE IF EXISTS spotify_tracks;

CREATE TABLE spotify_tracks(
	id INT AUTO_INCREMENT,
    track_name VARCHAR(250),
    artist VARCHAR(150),
    album VARCHAR(250),
    popularity INT,
    duration_minutes FLOAT,
	PRIMARY KEY(id)
);

#---Select_statement---
SELECT * 
FROM spotify_db.spotify_tracks;

TRUNCATE TABLE spotify_db.spotify_tracks;
