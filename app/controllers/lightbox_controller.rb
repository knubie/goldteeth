class LightboxController < ApplicationController

  def show
    @page = 'lightbox'
    @slides = []
    @post_slides = []
    if session[:slides].present?
      session[:slides][:project].each do |id|
        if Slide.exists?(id)
          @slides.push Slide.find(id)
        end
      end
      session[:slides][:post].each do |id|
        if PostImage.exists?(id)
          @post_slides.push PostImage.find(id)
        end
      end
    end
  end

  def add
    if session[:slides].nil?
      session[:slides] = {:project => [], :post => []}
    end
    if params[:model] == 'project'
      unless session[:slides][:project].include? params[:id]
        session[:slides][:project].push params[:id]
      end
    elsif params[:model] == 'post'
      unless session[:slides][:post].include? params[:id]
        session[:slides][:post].push params[:id]
      end
    end
    respond_to do |format|
      format.js {render :layout => false}
    end
  end

  def remove
    if params[:model] == 'project'
      if session[:slides][:project].include? params[:id]
        session[:slides][:project].delete params[:id]
        @slide = Slide.find params[:id]
      end
    elsif params[:model] == 'post'
      if session[:slides][:post].include? params[:id]
        session[:slides][:post].delete params[:id]
        @slide = PostImage.find params[:id]
      end
    end
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
