class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :name, null: false
      t.integer :project_id, null: false
      t.integer :position, default: 0, null: false

      t.timestamps
    end
  end
end
