class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :object_id, null: false
      t.string :object_type, null: false
      t.integer :user_id, null: false
      t.integer :notification_type, null: false
      t.integer :sub_object_id
      t.string :sub_object_type

      t.timestamps
    end
  end
end
