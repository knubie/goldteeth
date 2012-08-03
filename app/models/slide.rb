class Slide < ActiveRecord::Base
  belongs_to :project
  attr_accessible :image
end
