class ArtistsController < ApplicationController

  def index
    @page = "artists"
    @artists = Artist.order 'position'
  end

  def show
    @page = 'artists'
    @artist = Artist.find_by_name params[:name].gsub('-', ' ').tr('_', ' ').gsub(/\s+/, ' ').gsub(/\b\w/){ $`[-1,1] == "'" ? $& : $&.upcase }
    @recent_work = Post.find_all_by_artist_id(@artist.id)[0..3]
  end

  def update_sort
    params[:artist].each_with_index do |id, index|
      Artist.update_all({position: index+1}, {id: id})
    end
    render :nothing => true
  end

end
