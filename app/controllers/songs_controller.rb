class SongsController < ApplicationController
	def new
		@song = Song.new
		$song_user = User.find(params[:user_id])
		$playlist = Playlist.find(params[:playlist_id])
	end

	def create
		song_name = params[:song_name]
		artist_name = params[:artist_name]
		videos = Yt::Collections::Videos.new
		filtered_vids = videos.where(title: song_name + artist_name, order: 'viewCount', limit: 20)
		@video = filtered_vids.first

		
		@song = Song.create(video_id: @video.id)
		@song.song_name = song_name
		@song.artist_name = artist_name
		@song.playlist_id = $playlist.id
		@song.save
		$playlist.songs << @song
		redirect_to playlist_path(id: $playlist.id, user_id: $song_user.id)
	end

	
	def remove_song

	end

	def destroy
		song_name = params[:song_name]
		artist_name = params[:artist_name]
		@songToDelete = Song.where("song_name = :song_name and artist_name = :artist_name and playlist_id = :playlist_id", {song_name: song_name, artist_name: artist_name, playlist_id: $playlist.id}).first
		@songToDelete.destroy
		redirect_to playlist_path(id: $playlist.id, user_id: $song_user.id)
	end
end