class LightboxController < ApplicationController

  def show
    @page = 'lightbox'
    @slides = []
    session[:slides].each do |slide|
      @slides.push Slide.find(slide)
    end
  end

  def add
    session[:slides] = [] if session[:slides].nil?
    session[:slides].push params[:slide] unless session[:slides].include? params[:slide]
    respond_to do |format|
      format.js {render :layout => false}
    end
  end

  def remove
    session[:slides].delete params[:slide] if session[:slides].include? params[:slide]
    @slide = Slide.find params[:slide]
    respond_to do |format|
      format.js {render :layout => false}
    end
  end

  def clear
    session[:slides] = []
    respond_to do |format|
      format.js {render :layout => false}
    end
  end

  def pdf

    if session[:slides].empty?
      redirect_to :root
    end

    respond_to do |format|
      format.pdf do
        render  :pdf => "goldteethandco",
                :page_size => "Letter",
                :dpi => 120,
                :margin => {
                  :top => "0",
                  :right => "0",
                  :bottom => "0",
                  :left => "0"
                },
                :show_as_html => params[:debug],
                :disable_smart_shrinking => true,
                :print_media_type => true
      end
    end

  end

end
