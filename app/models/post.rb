class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true

  scope :desc, -> { order(id: :desc) }
  scope :published, -> { where(published: true) }
end
