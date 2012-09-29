class Project < ActiveRecord::Base

  belongs_to :artist
  has_many :slides, :order => "position"
  attr_accessible :client, :subtitle, :title, :image, :artist_id, :slides_attributes
  accepts_nested_attributes_for :slides, :allow_destroy => true
  mount_uploader :image, ImageUploader
  acts_as_list :scope => :artist

  #after_create :reset_slides_position
  #FIXME: reset slide order if deleting a slide

  # Virtual attributes

  def url_title
    title.downcase.gsub(" ", "-")
  end

  private

  def reset_slides_position
    slides = self.slides.order 'position'
    slides.each_with_index do |slide, index|
      slide.update_attribute :position, index+1
    end
  end

end
