class ArtistsController < ApplicationController

  def index
    @page = "artists"
    @artists = Artist.order 'position'
  end

  def show
    @artist = Artist.find_by_name params[:name].gsub('-', ' ').tr('_', ' ').gsub(/\s+/, ' ').gsub(/\b\w/){ $`[-1,1] == "'" ? $& : $&.upcase }
    @projects = @artist.projects.order 'position'
    @recent_work = @artist.posts.order("created_at DESC")[0..3]
    # @recent_work = Post.find_all_by_artist_id(@artist.id)[0..3]
  end

  def update_sort
    params[:artist].each_with_index do |id, index|
      Artist.update_all({position: index+1}, {id: id})
    end
    render :nothing => true
  end

  def update_sort_projects
    params[:project].each_with_index do |id, index|
      Project.update_all({position: index+1}, {id: id})
    end
    render :nothing => true
  end

end
