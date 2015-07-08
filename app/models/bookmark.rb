class Bookmark < ActiveRecord::Base
  belongs_to :topic

  before_save :fix_url

  private

  def fix_url
    unless url.match(/https?:\/\//)
      self.url = "http://#{self.url}"
    end
  end
end
