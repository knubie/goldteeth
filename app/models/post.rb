class Post < ActiveRecord::Base
  has_many :post_images
  belongs_to :artist
  attr_accessible :artist_id, :body, :client, :thumb, :post_images_attributes
  accepts_nested_attributes_for :post_images, :allow_destroy => true
  mount_uploader :thumb, ImageUploader
end
