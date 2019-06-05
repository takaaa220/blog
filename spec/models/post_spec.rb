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

    describe "#description" do
      it "is invalid without description" do
        @post.description = ""
        expect(@post).not_to be_valid
      end

      it "is invalid when description > 200" do
        @post.description = "a" * 201
        expect(@post).not_to be_valid
      end
    end
  end

  describe "callback" do
    it "changes published_at when published" do
      @post.save
      @post.toggle!(:published)

      expect(@post.reload.published_at).not_to be nil
    end

    it "not change published_at when not published" do
      @post = create(:post, { published: true })
      expect{
        @post.toggle!(:published)
      }.not_to change{ @post.reload.published_at }
    end
  end
end
