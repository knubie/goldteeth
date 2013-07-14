class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :lightbox_count
  def lightbox_count
    if session[:slides]
      return session[:slides][:project].length + session[:slides][:post].length
    else
      return 0
    end
  end
end
