class ChangeBggratingToFloatinPosts < ActiveRecord::Migration[7.1]
  def change
    change_column :posts, :bgg_rating, :float
  end
end
