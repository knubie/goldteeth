class Slide < ActiveRecord::Base
  belongs_to :project
  attr_accessible :image, :project_id
  mount_uploader :image, ImageUploader
end
