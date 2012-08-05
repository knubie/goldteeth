class Project < ActiveRecord::Base
  belongs_to :artist
  attr_accessible :client, :subtitle, :title, :artist_id
end
