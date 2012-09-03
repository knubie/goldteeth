class CreateArtistThumbs < ActiveRecord::Migration
  def change
    create_table :artist_thumbs do |t|
      t.string :image
      t.references :artist

      t.timestamps
    end
    add_index :artist_thumbs, :artist_id
  end
end
