class AddVideoToJokes < ActiveRecord::Migration
  def change
  	add_attachment :jokes, :video
  end
end
