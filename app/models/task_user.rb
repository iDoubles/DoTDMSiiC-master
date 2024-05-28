class TaskUser < ApplicationRecord
  belongs_to :user
  belongs_to :task

  delegate :project, to: :task

  after_create :notification_about_join

  private

  def notification_about_join
    project.users.find_each do |some_user|
      next if some_user.id == user_id
      Notification.create!(
        object: task,
        sub_object: user,
        user: some_user,
        notification_type: :join_to_task
      )
    end
  end
end
