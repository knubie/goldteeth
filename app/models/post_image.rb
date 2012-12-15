class PostImage < ActiveRecord::Base
  belongs_to :post
  attr_accessible :image, :video, :caption, :post_id
  mount_uploader :image, ImageUploader
  acts_as_list
end
