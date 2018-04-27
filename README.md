# README

Title: PlayList_live 
Team Members: Lauren Hong, Riya Shah 

Idea: An application where people can create and add to playlists in real time. When a song is added to the playlist a youtube video of hat song 
is also embedded to play. 

Models and Description: 
Song
 - has many and belongs to many playlists
Playlists
 - has many and belongs to many users 
 - also includes devise gem for authentication 
Playlist
- has many and belongs to many users
- has and belongs to many songs 

Features: 
- Users can log in and either join a playlist given a join name and join password
- Users can create a playlist 
- Admins(User who created playlist) can add or remove songs from a playlist
- Users can only add songs to a playlist 

Division of Labor: 
- Lauren: Created User, Playlist models 
- Riya: Youtube gem additions, Styling, Created Song model 


