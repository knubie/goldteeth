class Artist < ActiveRecord::Base


  has_many :projects, :order => 'position'
  has_many :artist_thumbs
  has_many :posts
  attr_accessible :bio, :name, :image, :artist_thumbs_attributes
  accepts_nested_attributes_for :artist_thumbs, :allow_destroy => true
  mount_uploader :image, ImageUploader
  acts_as_list

  # Virtual attributes

  def url_name
    name.downcase.gsub(" ", "-")
  end

end
