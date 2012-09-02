class InformationController < ApplicationController
  def show
    @page = 'info'
    @information = Information.find 1
    @client = Instagram.client(:access_token => "214594126.f59def8.0bd597e056804044b1d3173bb291565c")
    @user = @client.user
  end
end
