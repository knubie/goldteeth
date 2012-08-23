class PostsController < ApplicationController

  def index
    @page = 'news'
    @posts = Post.all
  end

  def show
  end

end
