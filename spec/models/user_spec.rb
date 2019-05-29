require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:user)
  end

  describe "validation" do
    it do
      expect(@user).to be_valid
    end

    describe "password" do
      it "is invalid with blank" do
        @user.password = nil
        expect(@user).not_to be_valid
      end

      it "is invalid < 8" do
        @user.password = "pass20"
        expect(@user).not_to be_valid
      end

      it "is invalid with regexp" do
        @user.password = "password"
        expect(@user).not_to be_valid
      end
    end

    describe "email" do
      it "is invalid with blank" do
        @user.email = ""
        expect(@user).not_to be_valid
      end

      it "is invalid with regexp" do
        @user.email = "invalid_email"
        expect(@user).not_to be_valid
      end

      it "is invalid without unique" do
        @user2 = build(:user, { email: @user.email })
        expect(@user2).not_to be_valid
      end

    end

    describe "status" do
      it "is invalid with blank" do
        @user.status = nil
        expect(@user).not_to be_valid
      end
    end
  end
end
