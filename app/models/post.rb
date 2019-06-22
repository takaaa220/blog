class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :description, presence: true, length: { maximum: 200 }

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  belongs_to :user

  scope :desc, -> { order(id: :desc) }
  scope :published, -> { where(published: true) }
  scope :count_per_month, -> { group("DATE_FORMAT(created_at, '%Y / %m')").count }

  before_create :create_pid
  before_update :changed_published_status

  def self.get_by_published_month(year, month)
    month_d = Date.new(year, month)

    where(published_at: month_d..month_d.end_of_month)
  end

  def self.posts_per_month
    Post.group("MONTH(date)")
  end

  private

  def changed_published_status
    if published_changed? && published_at.nil? && published?
      self.published_at = Time.zone.now
    end
  end

  def create_pid
    self.pid = SecureRandom.uuid
  end
end
