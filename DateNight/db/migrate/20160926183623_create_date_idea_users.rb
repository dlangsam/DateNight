class CreateDateIdeaUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :date_idea_users do |t|
    	t.string :yelp_id
    	t.integer :user_id             
      t.timestamps
    end
  end
end
