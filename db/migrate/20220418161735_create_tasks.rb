class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :project_id, null: false
      t.integer :user_id, null: false
      t.string :name, null: false
      t.text :description
      t.boolean :completed, default: false, null: false
      t.integer :topic_id, null: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
