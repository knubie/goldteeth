class ProjectsController < ApplicationController

  def show
    @page = 'artists'
    @artist = Artist.find_by_name params[:name].gsub('-', ' ').tr('_', ' ').gsub(/\s+/, ' ').gsub(/\b\w/){ $`[-1,1] == "'" ? $& : $&.upcase }
    @project = @artist.projects.find_by_title params[:title].gsub('-', ' ').tr('_', ' ').gsub(/\s+/, ' ').gsub(/\b\w/){ $`[-1,1] == "'" ? $& : $&.upcase }
    @slides = @project.slides.order 'position'
  end

  def grid
    @page = 'artists'
    @artist = Artist.find_by_name params[:name].gsub('-', ' ').tr('_', ' ').gsub(/\s+/, ' ').gsub(/\b\w/){ $`[-1,1] == "'" ? $& : $&.upcase }
    @project = @artist.projects.find_by_title params[:title].gsub('-', ' ').tr('_', ' ').gsub(/\s+/, ' ').gsub(/\b\w/){ $`[-1,1] == "'" ? $& : $&.upcase }
    @slides = @project.slides.order 'position'
  end

  def update_sort
    params[:slide].each_with_index do |id, index|
      Slide.update_all({position: index+1}, {id: id})
    end
    render :nothing => true
  end

end
