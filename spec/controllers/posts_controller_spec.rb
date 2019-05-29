require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @unpublished_post = create(:post)
    @published_post = create(:post, { published: true} )
  end

  describe "get #index" do
    before do
      @last_post = create(:post, { published: true} )
      get :index
      @posts = assigns(:posts)
    end

    it do
      expect(response).to have_http_status 200
    end

    it "show a post" do
      expect(@posts.size).to eq 2
    end

    it "show only published post" do
      expect(@posts.map(&:published).include?(false)).to be_falsey
    end

    it "show desc order" do
      expect(@posts.map(&:id)).to eq [@last_post.id, @published_post.id]
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
