class AddArtistToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :artist_id, :integer
  end
end
