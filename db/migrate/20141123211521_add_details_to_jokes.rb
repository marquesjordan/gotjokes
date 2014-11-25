class AddDetailsToJokes < ActiveRecord::Migration
  def change
    add_column :jokes, :youtube, :string
    add_column :jokes, :description, :string
  end
end
