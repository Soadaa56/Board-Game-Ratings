class AddRatingAchToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :rating_Ach, :integer
  end
end
