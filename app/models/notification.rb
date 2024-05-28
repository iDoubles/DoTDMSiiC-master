class Notification < ApplicationRecord
  belongs_to :object, polymorphic: true
  belongs_to :sub_object, polymorphic: true, optional: true
  belongs_to :user

  enum notification_type: %i[
    new_project
    join_to_project
    new_user
    join_to_task
  ]
end
