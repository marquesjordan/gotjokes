class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.string :name

      t.timestamps
    end
  end
end
