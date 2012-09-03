class Slide < ActiveRecord::Base
  belongs_to :project
  attr_accessible :image, :video, :caption, :project_id
  mount_uploader :image, ImageUploader
  acts_as_list
end
