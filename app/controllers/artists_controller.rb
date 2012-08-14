class ArtistsController < ApplicationController

  def index
    @page = "artists"
    @artists = Artist.all
  end

  def show
    @page = 'artists'
    @artist = Artist.find_by_name params[:name].gsub('-', ' ').tr('_', ' ').gsub(/\s+/, ' ').gsub(/\b\w/){ $`[-1,1] == "'" ? $& : $&.upcase }
  end

end
