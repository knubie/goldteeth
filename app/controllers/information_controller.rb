class InformationController < ApplicationController
  def show
    @page = 'info'
    @information = Information.find 1
  end
end
