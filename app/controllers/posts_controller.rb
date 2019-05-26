class PostsController < ApplicationController
  def index
    @posts = Post.published.desc
  end

  def show
    @post = Post.find(params[:id])
  end
end
