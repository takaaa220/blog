require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
  it "redirects to root without login" do
    get :index
    expect(response).to redirect_to root_path
    expect(response).to have_http_status 302
  end

  describe "#index" do
    before do
      @user = create(:user, { status: "admin" })
      login_as(@user)
    end

    it do
      get :index
      expect(response).to have_http_status 200
    end
  end

  describe "#toggle" do
    before do
      @user = create(:user, { status: "admin"} )
      login_as(@user)
    end

    it "raises without post" do
      expect {
        post :toggle, params: { id: 10000 }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "can publish post" do
      @post = create(:post)
      expect{
        post :toggle, params: { id: @post.id }
      }.to change { Post.last.published }.from(false).to(true)
    end

    it "can unpublished post" do
      @post = create(:post, { published: true} )
      expect {
        post :toggle, params: { id: @post.id }
      }.to change { Post.last.published }.from(true).to(false)
    end

    it "redirect_to admin_posts_path" do
      @post = create(:post)
      post :toggle, params: { id: @post.id }
      expect(response).to have_http_status 302
      expect(response).to redirect_to admin_posts_path
    end
  end
end
