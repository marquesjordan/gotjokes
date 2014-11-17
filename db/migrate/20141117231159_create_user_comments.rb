class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.string :description

      t.timestamps
    end
  end
end
