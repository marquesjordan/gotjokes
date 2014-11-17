class Category < ActiveRecord::Base

	def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      ## you can add more stuff as per your requirements 
      t.timestamps
    end
end

