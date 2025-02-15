from spotipy.oauth2 import SpotifyClientCredentials
import spotipy
import pandas as pd
import matplotlib.pyplot as plt
import re

# Set Up Client Credentials

sp = spotipy.Spotify(auth_manager=SpotifyClientCredentials(
    client_id='6e8b2f4831254941bae062f6a021eae2',
    client_secret='5eddfd32b54e4cc0841122c3f8fef635'
))

#Full track URL
track_url='https://open.spotify.com/track/7qiZfU4dY1lWllzX7mPBI3'

#Extract track ID directly from URL using regex
track_id=re.search(r'track/([a-zA-Z0-9]+)',track_url).group(1)

#Fetch track details
track=sp.track(track_id)
print(track)

#Extract metadata
track_data={
    'Track Name' : track['name'],
    'Artist' : track['artists'][0]['name'],
    'Album' : track['album']['name'],
    'Popularity' : track['popularity'],
    'Duration(minutes)' : track['duration_ms']/60000
}

#Display metadata
print("\nDetails of track URL\n")
print(f"\nTrack Name : {track_data['Track Name']}")
print(f"Artist : {track_data['Artist']}")
print(f"Album : {track_data['Album']}")
print(f"Popularity : {track_data['Popularity']}")
print(f"Duration  : {track_data['Duration(minutes)']:.2f} minutes")
print("\n")

#Convert metadata to Dataframe
data_frame=pd.DataFrame([track_data])
print('\nTrack Data as DataFrame:\n')
print(data_frame)

#Save metadata to CSV
data_frame.to_csv('spotify_track_data.csv',index=False)

#Visulaize track data
features=['Popularity','Duration(minutes)']
values=[track_data['Popularity'],track_data['Duration(minutes)']]

plt.figure(figsize=(7,5))
plt.bar(features,values,color='skyblue',edgecolor='black')
plt.title(f"Track Metadata for '{track_data['Track Name']}'")
plt.ylabel('value')
plt.show()










