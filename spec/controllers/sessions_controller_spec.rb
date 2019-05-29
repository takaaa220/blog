require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    @user = create(:user)
  end

  describe "#new" do
    it "200 without current_user" do
      get :new
      expect(response).to have_http_status 200
    end

    it "redirect to root with current_user" do
      login_as(@user)
      get :new
      expect(response).to have_http_status 302
      expect(response).to redirect_to root_path
    end
  end

  describe "#create" do
    it "can login" do
      post :create, params: { email: @user.email, password: @user.password }
      expect(response).to redirect_to root_path
    end

    it "cannot login" do
      post :create, params: { email: @user.email, password: "invalid" }
      expect(response).to render_template :new
    end
  end

  # describe "#destory" do
  # end
end