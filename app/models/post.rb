class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :description, presence: true, length: { maximum: 200 }

  belongs_to :user

  scope :desc, -> { order(id: :desc) }
  scope :published, -> { where(published: true) }

  before_update :changed_published_status

  def self.posts_per_month
    Post.group("MONTH(date)")
  end

  private

  def changed_published_status
    if published_changed? && published_at.nil? && published?
      self.published_at = Time.zone.now
    end
  end
end
