class Artist < ActiveRecord::Base
  has_many :projects
  attr_accessible :bio, :name, :image
  mount_uploader :image, ImageUploader
end
