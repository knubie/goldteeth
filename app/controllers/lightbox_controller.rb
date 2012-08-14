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

end
