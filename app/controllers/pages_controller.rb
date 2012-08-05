class PagesController < ApplicationController
  def artists
    @page = "artists"
    @artists = Artist.all
  end

  def news
    @page = "news"
  end

  def info
    @page = "info"
  end
end
