class Project < ActiveRecord::Base
  belongs_to :artist
  has_many :slides
  attr_accessible :client, :subtitle, :title, :image, :artist_id, :slides_attributes
  accepts_nested_attributes_for :slides, :allow_destroy => true
  mount_uploader :image, ImageUploader

  # Virtual attributes

  def url_title
    title.downcase.gsub(" ", "-")
  end

end
