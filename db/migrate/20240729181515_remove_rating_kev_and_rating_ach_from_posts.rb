class RemoveRatingKevAndRatingAchFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :rating_kev, :integer
    remove_column :posts, :rating_ach, :integer
  end
end
