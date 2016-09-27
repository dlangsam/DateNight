class AddInfoToDateIdeas < ActiveRecord::Migration[5.0]
  def change
  	add_column :date_ideas, :image_file, :string
  	add_column :date_ideas, :city, :string
  	add_column :date_ideas, :latitude, :float
  	add_column :date_ideas, :longitude, :float
  end
end
