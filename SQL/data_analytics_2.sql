#---Retrieve all records
SELECT * 
FROM spotify_db.spotify_tracks;

#---Count the total number of tracks
SELECT COUNT(*) AS total_tracks
FROM spotify_db.spotify_tracks;

#---Find the most popular track
SELECT * 
FROM spotify_db.spotify_tracks
ORDER BY popularity DESC
LIMIT 1;

#---List all unique artists
SELECT DISTINCT artist
FROM spotify_db.spotify_tracks;

#--- Aggregate Functions (Average, Min, Max, Sum)
SELECT 
	AVG(popularity) AS avarage_popularity,
    MIN(popularity) AS least_popular,
    MAX(popularity) AS most_popular,
    MAX(duration_minutes) AS maximum_duration,
    MIN(duration_minutes) AS minimum_duration
FROM spotify_db.spotify_tracks;

#--- Using CASE Statements
#---Classify songs based on popularity score:

SELECT track_name,album,popularity,
	CASE
		WHEN popularity>=80 THEN 'Very popular album'
        WHEN popularity>=60 THEN 'Moderately popular album'
        WHEN popularity<60 THEN 'Less popular album'
	END AS popularity_category
FROM spotify_db.spotify_tracks
ORDER BY popularity_category DESC;

#---Handling NULL values
#---If some records have NULL popularity, replace them with the average popularity:
BEGIN;
UPDATE spotify_tracks
SET popularity=NULL
WHERE id=1;
ROLLBACK;
COMMIT;


SELECT popularity,
	COALESCE(popularity,(SELECT AVG(popularity) FROM spotify_db.spotify_tracks)) AS ajusted_popularity
FROM spotify_db.spotify_tracks;

BEGIN;
UPDATE spotify_tracks
SET popularity=84
WHERE id=1;
ROLLBACK;
COMMIT;

#---String Functions
#---Extract first word from track names:

SELECT track_name,
	LEFT(track_name,1) AS track_first_letter
FROM spotify_db.spotify_tracks;


SELECT track_name,
	SUBSTRING_INDEX(track_name,' ',1) AS first_word 
FROM spotify_tracks;

#---Subqueries
#---Find tracks whose popularity is above the average:

SELECT track_name,artist,popularity,
	(SELECT AVG(popularity) FROM spotify_db.spotify_tracks) AS avarage_popularity
FROM spotify_db.spotify_tracks
WHERE popularity>   (SELECT AVG(popularity) 
					 FROM spotify_db.spotify_tracks);

#---View
#---Create a view for popular tracks (popularity > 70):

CREATE VIEW popular_tracks AS 
	SELECT track_name, artist, album, popularity 
    FROM spotify_db.spotify_tracks
    WHERE popularity>70;

#---Retrieve data from the view:
SELECT * FROM popular_tracks;

#---Window Functions
#---Rank tracks based on popularity within albums:

SELECT track_name,artist,album,popularity,
	RANK() OVER(ORDER BY popularity DESC) AS popular_track
FROM spotify_db.spotify_tracks;

#---Indexing (Improving Performance)
#---Create an index on artist and popularity:

CREATE INDEX index_artist_popularity ON spotify_db.spotify_tracks(artist,popularity);
        
#--- Partitioning
#---Partition the table based on popularity ranges:
    
ALTER TABLE spotify_db.spotify_tracks
DROP PRIMARY KEY,
ADD PRIMARY KEY (id, popularity);


ALTER TABLE spotify_db.spotify_tracks
PARTITION BY RANGE(popularity)(
    PARTITION less_popular VALUES LESS THAN (50),
    PARTITION modarately_popular VALUES LESS THAN (80),
    PARTITION very_popular VALUES LESS THAN (100),
	PARTITION super_popular VALUES LESS THAN (MAXVALUE)
);


#--- Regular Expressions (Regex)
#---Find all songs with numbers in their titles:

SELECT * 
FROM spotify_db.spotify_tracks
WHERE album REGEXP '^[0-9]';
        
        
        
        
        
        
        
        
        
        
        