class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :videos
      t.string :image
      t.string :location
      t.string :bio

      t.timestamps
    end
  end
end
