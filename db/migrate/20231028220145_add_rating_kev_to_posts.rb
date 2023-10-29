class AddRatingKevToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :rating_kev, :integer
  end
end
