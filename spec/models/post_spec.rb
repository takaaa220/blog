require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = build(:post)
  end

  describe "validation" do
    it do
      expect(@post).to be_valid
    end

    describe "#title" do
      it "is invalid without title" do
        @post.title = ""
        expect(@post).not_to be_valid
      end

      it "is invalid when title > 50" do
        @post.title = "a" * 51
        expect(@post).not_to be_valid
      end
    end

    describe "#content" do
      it "is invalid without content" do
        @post.content = ""
        expect(@post).not_to be_valid
      end
    end
  end
end
