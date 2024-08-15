class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 80 }
  validates :bgg_id, presence: true, numericality: { only_integer: true }, allow_nil: true
  belongs_to :user
  has_many :pins
  has_many :ratings
  accepts_nested_attributes_for :ratings

  # has_rich_text :body

  def self.ransackable_attributes(auth_object = nil)
    ["title", "user", "body", "bgg_ratings"]
  end

  def average_admin_score
    admin_ratings = ratings.joins(:user).where(users: { role: "admin" })
    return nil if admin_ratings.empty?
    admin_ratings.average(:score)
  end

  def average_user_score
    user_ratings = ratings.joins(:user).where(users: { role: "user" })
    return nil if user_ratings.empty?
    user_ratings.average(:score)
  end

  def combined_average_score
    total_ratings = ratings.count
    return nil if total_ratings.zero?

    total_score = ratings.sum(:score)
    total_score.to_f / total_ratings
  end
end
