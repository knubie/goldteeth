class ProjectsController < ApplicationController

  def show
    @artist = Artist.find(:first, :conditions => [ "lower(name) = ?", params[:name].gsub('-', ' ').tr('_', ' ').gsub(/\s+/, ' ').gsub(/\b\w/){ $`[-1,1] == "'" ? $& : $&.upcase }.downcase ])
    @project = @artist.projects.find(:first, :conditions => [ "lower(title) = ?", params[:title].gsub('-', ' ').tr('_', ' ').gsub(/\s+/, ' ').gsub(/\b\w/){ $`[-1,1] == "'" ? $& : $&.upcase }.downcase ])
    @slides = @project.slides.order 'position'
    # For share links
    @url = ""
    @title = "Goldteeth%26Co%20%2F%20#{@artist.name}%20%2F%20#{@project.title}"
    @desc = @project.subtitle
  end

  def grid
    @artist = Artist.find(:first, :conditions => [ "lower(name) = ?", params[:name].gsub('-', ' ').tr('_', ' ').gsub(/\s+/, ' ').gsub(/\b\w/){ $`[-1,1] == "'" ? $& : $&.upcase }.downcase ])
    @project = @artist.projects.find(:first, :conditions => [ "lower(title) = ?", params[:title].gsub('-', ' ').tr('_', ' ').gsub(/\s+/, ' ').gsub(/\b\w/){ $`[-1,1] == "'" ? $& : $&.upcase }.downcase ])
    @slides = @project.slides.order 'position'
  end

  def update_sort
    params[:slide].each_with_index do |id, index|
      Slide.update_all({position: index+1}, {id: id})
    end
    render :nothing => true
  end

end
