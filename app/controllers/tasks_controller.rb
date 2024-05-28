class TasksController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :user_in_team

  def create
    @task = Task.new(task_params)
    task.position = topic.next_task_position
    task.project = project
    task.user = current_user
    task.save
    respond_to do |format|
      format.turbo_stream
    end
  end

  def update
    @old_topic = task.topic
    task.update(task_params)
    @topic = task.topic
    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @topic = task.topic
    task.destroy
    respond_to do |format|
      format.turbo_stream
    end
  end

  def join
    task.users << current_user
    redirect_to project
  end

  private

  def topic
    @topic ||= Topic.find(task_params[:topic_id])
  end

  def task
    @task ||= Task.find(params[:id])
  end

  def project
    @project ||= (Project.find(params[:project_id]) if params[:project_id])|| task.project
  end

  def user_in_team
    redirect_back(fallback_location: root_path) unless project.in_team?(current_user)
  end

  def task_params
    params.require(:task).permit(:name, :description, :complated, :topic_id)
  end
end
