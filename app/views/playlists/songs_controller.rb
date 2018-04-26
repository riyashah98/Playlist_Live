class SongsController < ApplicationController
	def new
		@song = Song.new
		$playlist = Playlist.find(params[:playlist_id])
	end

	def create
		song_name = params[:song_name]
		artist_name = params[:artist_name]
		yt = YTCLient.initialize('RubyRailsAppYT', '08080808ruby', "admin")
		video = yt.find_all(title: song_name, keywords: artist_name).first
		@song = Song.create(video_url: video.thumbnail_url)
		@song.song_name = song_name
		@song.artist_name = artist_name
		@song.playlist_id = $playlist.id
		@song.save
		redirect_to playlist_path($playlist)
	end
end