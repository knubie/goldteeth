class ArtistThumb < ActiveRecord::Base
  belongs_to :artist
  attr_accessible :image, :artist_id
  mount_uploader :image, ImageUploader
end
