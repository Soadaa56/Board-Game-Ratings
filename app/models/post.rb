class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 2, maximum: 80}
  validates :rating, numericality: { only_integer: true, allow_nil: true, in: 1..10 }
  belongs_to :user
end
