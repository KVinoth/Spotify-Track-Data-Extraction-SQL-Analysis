from spotipy.oauth2 import SpotifyClientCredentials
import spotipy
import pandas as pd
import matplotlib.pyplot as plt
import re
import mysql.connector

# Set Up Client Credentials

sp = spotipy.Spotify(auth_manager=SpotifyClientCredentials(
    client_id='6e8b2f4831254941bae062f6a021eae2',
    client_secret='5eddfd32b54e4cc0841122c3f8fef635'
))

#MYSQL Database connection
db_config = {
    'host':'localhost',
    'user':'root',
    'password':'root',
    'database':'spotify_db'
}

#Connection to Database
connection=mysql.connector.connect(**db_config)
cursor=connection.cursor()

#Full track URL
track_url='https://open.spotify.com/track/7qiZfU4dY1lWllzX7mPBI3'

#Extract track ID directly from URL using regex
track_id=re.search(r'track/([a-zA-Z0-9]+)',track_url).group(1)

#Fetch track details
track=sp.track(track_id)

#Extract metadata
track_data={
    'Track Name' : track['name'],
    'Artist' : track['artists'][0]['name'],
    'Album' : track['album']['name'],
    'Popularity' : track['popularity'],
    'Duration(minutes)' : track['duration_ms']/60000
}

#Insert data into MYSQL
insert_query= """
INSERT INTO spotify_tracks(track_name,artist,album,popularity,duration_minutes)
VALUES(%s,%s,%s,%s,%s)
"""

cursor.execute(insert_query,(
    track_data['Track Name'],
    track_data['Artist'],
    track_data['Album'],
    track_data['Popularity'],
    track_data['Duration(minutes)']
))
connection.commit()

print(f"Track '{track_data['Track Name']}'by {track_data['Artist']} Inserted into the database.")


#Close the connection
cursor.close()
connection.close()