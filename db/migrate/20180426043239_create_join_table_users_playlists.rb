class CreateJoinTableUsersPlaylists < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :playlists do |t|
      # t.index [:user_id, :playlist_id]
      # t.index [:playlist_id, :user_id]
    end
  end
end
