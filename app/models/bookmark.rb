class Bookmark < ActiveRecord::Base
  extend FriendlyId
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  before_create :generate_slug
  before_save :fix_url

  friendly_id :url, use: :slugged
  validates :url, presence: true
  validates :slug, presence: true

  scope :visible_to, -> (user) { Bookmark.where(user: user) }
  scope :liked_by, -> (user) { Bookmark.where(id: Like.where(user: user).pluck(:bookmark_id)) }

  private

  def generate_slug
    self.slug = url.parameterize
  end

  def fix_url
    unless url.match(/https?:\/\//)
      self.url = "http://#{self.url}"
    end
  end
end
