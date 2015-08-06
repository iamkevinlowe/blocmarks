class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  before_save :fix_url

  scope :visible_to, -> (user) { Bookmark.where(user: user) }
  scope :liked_by, -> (user) { Bookmark.where(id: Like.where(user: user).pluck(:bookmark_id)) }

  private

  def fix_url
    unless url.match(/https?:\/\//)
      self.url = "http://#{self.url}"
    end
  end
end
