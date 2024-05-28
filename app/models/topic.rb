class Topic < ApplicationRecord
  belongs_to :project
  has_many :tasks, -> { order(position: :asc) }

  def next_task_position
    tasks.any? ? tasks.last.position+1 : 0 
  end
end
