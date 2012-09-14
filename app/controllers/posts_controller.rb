class PostsController < ApplicationController

  def index
    @page = 'news'
    @posts = Post.order("created_at DESC").page(params[:page]).per(15)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @page = 'news'
    @post = Post.find params[:id]
  end

  def grid
    @page = 'news'
    @posts = Post.find(:all, :order => "created_at DESC")
  end

  def update_sort
    params[:post_image].each_with_index do |id, index|
      PostImage.update_all({position: index+1}, {id: id})
    end
    render :nothing => true
  end

end
