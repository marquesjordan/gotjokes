class AddUserCommentAssociationToJoke < ActiveRecord::Migration
  def self.up
    add_column :user_comments, :joke_id, :integer
    # add_index 'user_comment', ['joke_id'], :name => 'index_joke_id'
  end

  def self.down
    remove_column :user_comments, :joke_id
  end
end
