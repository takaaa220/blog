class PostsController < UserPageController
  def index
    @posts = PostDecorator.decorate_collection(Post.published.desc.page(params[:page]).per(10))
  end

  def show
    @post = Post.published.find_by(pid: params[:pid])&.decorate
    not_found if @post.nil?
  end
end
