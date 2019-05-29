class Admin::PostsController < Admin::BaseController
  def index
    @posts = Admin::PostDecorator.decorate_collection(Post.all.desc)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def toggle
    post = Post.find(params[:id])
    post.toggle!(:published)
    redirect_to admin_posts_path
  end
end
