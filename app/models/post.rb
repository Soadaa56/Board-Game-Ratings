class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 2, maximum: 80}
  validates :rating, numericality: { only_integer: true, allow_nil: true, in: 1..10 }
  belongs_to :user

  # has_rich_text :body

  def self.ransackable_attributes(auth_object = nil)
    ["title", "user", "body", "rating", "bgg_ratings"]
  end
end
