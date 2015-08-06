class Topic < ActiveRecord::Base
  extend FriendlyId
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  before_create :generate_slug
  before_save :title_capitalize

  friendly_id :title, use: :slugged
  validates :title, length: { minimum: 2 }, presence: true
  validates :slug, presence: true 

  scope :visible_to, -> (user) { Topic.where(id: Bookmark.where(user: user).pluck(:topic_id)) }

  private

  def generate_slug
    self.slug = title.parameterize
  end

  def title_capitalize
    self.title.capitalize!
  end
end
