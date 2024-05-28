class ProjectUser < ApplicationRecord
  belongs_to :user
  belongs_to :project

  after_create :notification_about_join

  private

  def notification_about_join
    project.users.find_each do |some_user|
      next if some_user.id == user_id
      Notification.create!(
        object: project,
        sub_object: user,
        user: some_user,
        notification_type: :join_to_project
      )
    end
  end
end
