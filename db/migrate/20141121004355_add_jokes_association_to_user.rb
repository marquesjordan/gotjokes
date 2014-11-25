class AddJokesAssociationToUser < ActiveRecord::Migration
  def self.up
    add_column :jokes, :user_id, :integer
    # add_index 'lists', ['user_id'], :name => 'index_user_id'
  end

  def self.down
    remove_column :jokes, :user_id
  end
end
