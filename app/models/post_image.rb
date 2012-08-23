class PostImage < ActiveRecord::Base
  belongs_to :post
  attr_accessible :image, :post_id
  mount_uploader :image, ImageUploader
end
