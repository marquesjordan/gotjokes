class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.integer :views
      t.integer :totalvotes

      t.timestamps
    end
  end
end
