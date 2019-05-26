class PostsController < UserPageController
  def index
    @posts = Post.published.desc.map(&:decorate)
  end

  def show
    @post = Post.find(params[:id]).decorate
  end
end
