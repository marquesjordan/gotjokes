class DefualtColumn < ActiveRecord::Migration
  def change
  	change_column :jokes, :totalvotes, :integer, :default => 0
  end
end
