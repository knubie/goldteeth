class Project < ActiveRecord::Base
  belongs_to :artist
  attr_accessible :client, :subtitle, :title, :image, :artist_id
  mount_uploader :image, ImageUploader
end
