class Artist < ActiveRecord::Base

  has_many :projects
  attr_accessible :bio, :name, :image
  mount_uploader :image, ImageUploader
  acts_as_list

  # Virtual attributes

  def url_name
    name.downcase.gsub(" ", "-")
  end

end
