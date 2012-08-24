class PostsController < ApplicationController

  def index
    @page = 'news'
    @posts = Post.all
  end

  def show
    @page = 'news'
    @post = Post.find params[:id]
  end

  def grid
    @page = 'news'
    @posts = Post.all
  end

end
