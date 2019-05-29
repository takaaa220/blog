class PostsController < UserPageController
  def index
    @posts = Post.published.desc.map(&:decorate)
  end

  def show
    @post = Post.published.find(params[:id]).decorate
  end
end
