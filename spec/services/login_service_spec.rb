require "rails_helper"

RSpec.describe "LoginService" do
  before do
    @user = create(:user)
  end

  it "can login" do
    @login = LoginService.new(email: @user.email, password: @user.password)
    expect(@login.call).to eq @user
  end

  it "can not invalid email" do
    @login = LoginService.new(email: "a@a.a", password: @user.password)
    expect(@login.call).to be_nil
  end

  it "can not invalid password" do
    @login = LoginService.new(email: @user.email, password: "password")
    expect(@login.call).to be_nil
  end
end