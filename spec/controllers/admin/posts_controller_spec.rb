require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
  before(:each) do
    @user = create(:user, { status: "admin" })
    @post = create(:post,  { user: @user })
  end

  let(:correct_params) { attributes_for(:post, { user: nil }) }
  let(:uncorrect_params) { attributes_for(:post, { user: nil, title: "" }) }

  it "redirects in index" do
    get :index
    expect(response).to redirect_to root_path
    expect(response).to have_http_status 302
  end

  it "redirects in show" do
    get :show, params: { pid: @post.pid }
    expect(response).to redirect_to root_path
    expect(response).to have_http_status 302
  end

  describe "#index" do
    before do
      login_as(@user)
    end

    it do
      get :index
      expect(response).to have_http_status 200
    end
  end

  describe "#show" do
    before do
      login_as(@user)
    end

    it do
      get :show, params: { pid: @post.pid }
      expect(response).to have_http_status 200
    end

    it "not found" do
      expect {
        get :show, params: { pid: 10000 }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "#create" do
    before do
      login_as(@user)
    end

    context "success" do
      it "increases db" do
        expect {
          post :create, params: { post: correct_params }
        }.to change {Post.count}.by(1)
      end

      it "redirect" do
        post :create, params: { post: correct_params }
        expect(response).to redirect_to admin_post_path(Post.last.pid)
      end
    end

    context "failure" do
      it "not increase db" do
        expect {
          post :create, params: { post: uncorrect_params }
        }.not_to change{ Post.count }
      end

      it "render edit" do
        post :create, params: { post: uncorrect_params }
        expect(response).to render_template "admin/posts/new"
      end
    end
  end

  describe "#update" do
    before do
      login_as(@user)
    end

    context "success" do
      it "change title" do
        changed_title = "hello world"
        expect{
          post :update, params: { pid: @post.pid, post: attributes_for(:post, { user: nil, title: changed_title })}
        }.to change { Post.find(@post.id).title }.from(@post.title).to(changed_title)
      end

      it "redirect" do
        post :update, params: { pid: @post.pid, post: correct_params }
        expect(response).to redirect_to admin_post_path(@post.pid)
      end
    end

    context "failure" do
      it "not increase db" do
        expect {
          post :update, params: { pid: @post.pid, post: { title: "", content: "hello world"} }
        }.not_to change{ Post.find(@post.id).title }
      end

      it "render edit" do
        post :update, params: { pid: @post.pid, post: { title: "", content: "hello world"} }
        expect(response).to render_template "admin/posts/edit"
      end
    end
  end

  describe "#destroy" do
    before do
      login_as(@user)
    end

    it do
      expect{
        delete :destroy, params: { pid: @post.pid }
      }.to change { Post.count }.by(-1)
    end
  end

  describe "#toggle" do
    before do
      login_as(@user)
    end

    it "raises without post" do
      expect {
        post :toggle, params: { pid: 10000 }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "can publish post" do
      expect{
        post :toggle, params: { pid: @post.pid }
      }.to change { Post.last.published }.from(false).to(true)
    end

    it "can unpublished post" do
      @post = create(:post, { published: true, user: @user } )
      expect {
        post :toggle, params: { pid: @post.pid }
      }.to change { Post.last.published }.from(true).to(false)
    end

    it "redirect_to admin_posts_path" do
      post :toggle, params: { pid: @post.pid }
      expect(response).to have_http_status 302
      expect(response).to redirect_to admin_posts_path
    end
  end
end
