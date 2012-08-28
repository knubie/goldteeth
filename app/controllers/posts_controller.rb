class PostsController < ApplicationController

  def index
    @page = 'news'
    @posts = Post.find(:all, :order => "created_at DESC")
  end

  def show
    @page = 'news'
    @post = Post.find params[:id]
  end

  def grid
    @page = 'news'
    @posts = Post.find(:all, :order => "created_at DESC")
  end

end
