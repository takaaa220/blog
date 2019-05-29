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
end
