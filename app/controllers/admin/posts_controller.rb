class Admin::PostsController < Admin::BaseController
  def index
    @posts = Admin::PostDecorator.decorate_collection(Post.all.desc)
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.save(post_params)
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to admin_posts_path
  end

  def toggle
    post = Post.find(params[:id])
    post.toggle!(:published)
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
