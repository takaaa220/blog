class Admin::PostsController < Admin::BaseController
  def index
    @posts = Admin::PostDecorator.decorate_collection(Post.all.desc)
  end

  def show
    @post = current_user.posts.find_by(pid: params[:pid])&.decorate
    not_found if @post.nil?
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to admin_post_path(@post.pid)
    else
      render :new
    end
  end

  def edit
    @post = current_user.posts.find_by(pid: params[:pid])
    not_found if @post.nil?
  end

  def update
    @post = current_user.posts.find_by(pid: params[:pid])
    not_found if @post.nil?

    if @post.update(post_params)
      redirect_to admin_post_path(@post.pid)
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find_by(pid: params[:pid])
    not_found if @post.nil?

    @post.destroy!
    redirect_to admin_posts_path
  end

  def toggle
    post = Post.find_by(pid: params[:pid])
    not_found if post.nil?

    post.toggle!(:published)
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :description)
  end
end
