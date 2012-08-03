class PagesController < ApplicationController
  def artists
    @page = "artists"
  end

  def news
    @page = "news"
  end

  def info
    @page = "info"
  end
end
