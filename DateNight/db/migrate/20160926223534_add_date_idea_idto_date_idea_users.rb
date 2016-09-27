class AddDateIdeaIdtoDateIdeaUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :date_idea_users, :date_idea_id, :integer
  end
end
