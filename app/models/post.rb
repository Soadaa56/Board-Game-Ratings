class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 2, maximum: 80}
  belongs_to :user
  has_many :pins
  has_many :ratings

  # has_rich_text :body

  def self.ransackable_attributes(auth_object = nil)
    ["title", "user", "body", "bgg_ratings"]
  end

  def average_admin_score
    admin_ratings = ratings.joins(:user).where(users: { admin: true })
    return nil if admin_ratings.empty?
    admin_ratings.average(:score)
  end
end
