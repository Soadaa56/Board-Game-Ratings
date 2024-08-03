class AddBggIdToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :bgg_id, :integer
  end
end
