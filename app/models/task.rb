class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project, counter_cache: true
  belongs_to :topic
  has_many :task_users
  has_many :users, through: :task_users

  has_rich_text :description
end
