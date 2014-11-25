class AddCategoryIdToJokes < ActiveRecord::Migration
  def change
    add_column :jokes, :category_id, :integer
  end
end
