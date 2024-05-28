class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :start_at, null: false
      t.datetime :finish_at, null: false
      t.integer :budget, default: 0, null: false
      t.integer :tasks_count, default: 0, null: false
      t.integer :completed_tasks_count, default: 0, null: false

      t.timestamps
    end
  end
end
