class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true

  belongs_to :user

  scope :desc, -> { order(id: :desc) }
  scope :published, -> { where(published: true) }

  def self.posts_per_month
    Post.group("MONTH(date)")
  end
end
