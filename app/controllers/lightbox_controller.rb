class LightboxController < ApplicationController

  def add
    session[:slides] = [] if session[:slides].nil?
    session[:slides].push params[:slide] unless session[:slides].include? params[:slide]
    respond_to do |format|
      format.js {render :layout => false}
    end
  end

  def remove
    session[:slides].pop params[:slide] if session[:slides].include? params[:slide]
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
      format.html { render :layout => false }
      format.pdf do
        render  :pdf => "goldteethandco",
                :page_size => "Letter",
                :dpi => "120",
                :margin => {
                  :top => "0",
                  :right => "0",
                  :bottom => "0",
                  :left => "0"
                },
                :show_as_html => params[:debug]
      end
    end

  end

end
