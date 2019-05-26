require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @unpublished_post = create(:post)
    @published_post = create(:post, { published: true} )
  end

  describe "get #index" do
    before do
      get :index
      @posts = assigns(:posts)
    end

    it do
      expect(response).to have_http_status 200
    end

    it "show a post" do
      expect(@posts.size).to eq 1
    end

    it "show only published post" do
      expect(@posts.first).to eq @published_post
    end

    it "show desc order" do
      @last_post = create(:post, { published: true} )
      expect(@posts).to eq [@last_post, @published_post]
    end
  end

  describe "get #show" do
    it "is 200 with published post" do
      get :show, params: { id: @published_post.id }
      expect(response).to have_http_status 200
    end

    it "is 404 with unpublished post" do
      expect {
        get :show, params: { id: @unpublished_post.id }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "is 404 with not post" do
      expect {
        get :show, params: { id: Post.last.id + 1 }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
