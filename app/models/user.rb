class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :topics

  before_create :generate_slug

  friendly_id :name, use: :slugged
  validates_presence_of :name, :slug

  private

  def generate_slug
    self.slug = name.parameterize
  end

end
