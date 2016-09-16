class CreateDateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :date_ideas do |t|

      t.timestamps
    end
  end
end
