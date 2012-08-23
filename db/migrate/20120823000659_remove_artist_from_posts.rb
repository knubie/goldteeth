class RemoveArtistFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :artist
  end

  def down
    add_column :posts, :artist, :string
  end
end
