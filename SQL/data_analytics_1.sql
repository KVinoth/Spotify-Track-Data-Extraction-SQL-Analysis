#--- Analytics---

SELECT * 
FROM spotify_db.spotify_tracks;

#---Most_popular_track
SELECT track_name,artist,album,popularity
FROM spotify_db.spotify_tracks
ORDER BY popularity DESC
LIMIT 1;

#---Avarage_duration
SELECT AVG(duration_minutes) AS avarage_duration
FROM spotify_db.spotify_tracks;

#---Over_duration
SELECT track_name,artist,album,popularity,duration_minutes
FROM spotify_db.spotify_tracks
WHERE duration_minutes>3.7;

#---Popularity_range_count
SELECT 
	CASE
		WHEN popularity>=75  THEN 'Very Pupular'
		WHEN popularity>=50 THEN 'Popular'
		ELSE 'Less Popular'
	END AS popularity_range,
    COUNT(*) AS track_count
FROM spotify_db.spotify_tracks
GROUP BY popularity_range;

