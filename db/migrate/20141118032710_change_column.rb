class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :jokes, :views, :integer, :default => 0
  end
end
