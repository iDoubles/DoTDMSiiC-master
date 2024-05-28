class CreateTaskUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :task_users do |t|
      t.integer :user_id, null:false
      t.integer :task_id, null:false

      t.timestamps
    end
  end
end
