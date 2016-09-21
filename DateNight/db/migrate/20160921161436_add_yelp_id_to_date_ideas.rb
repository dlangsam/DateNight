class AddYelpIdToDateIdeas < ActiveRecord::Migration[5.0]
  def change
    add_column :date_ideas, :yelp_id, :string
  end
end
