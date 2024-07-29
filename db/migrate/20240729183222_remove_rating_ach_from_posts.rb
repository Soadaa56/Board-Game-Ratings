class RemoveRatingAchFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :rating_Ach, :integer
  end
end
