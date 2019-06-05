class PostsController < UserPageController
  def index
    @posts = Post.published.desc.map(&:decorate)
  end

  def show
    @post = Post.published.find_by(pid: params[:pid])&.decorate
    not_found if @post.nil?
  end
end
