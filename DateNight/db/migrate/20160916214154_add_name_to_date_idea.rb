class AddNameToDateIdea < ActiveRecord::Migration[5.0]
  def change
    add_column :date_ideas, :name, :string
  end
end
