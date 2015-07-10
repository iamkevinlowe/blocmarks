class Topic < ActiveRecord::Base
  extend FriendlyId
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  before_create :generate_slug

  friendly_id :title, use: :slugged
  validates :title, length: { minimum: 2 }, presence: true
  validates :slug, presence: true 

  private

  def generate_slug
    self.slug = title.parameterize
  end
end
