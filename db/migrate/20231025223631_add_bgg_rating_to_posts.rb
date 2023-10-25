class AddBggRatingToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :bgg_rating, :integer
  end
end
