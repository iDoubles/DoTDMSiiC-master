class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_in_team

  def create
    @topic = Topic.new(topic_params)
    topic.position = project.next_topic_position
    topic.project = project
    topic.save
    respond_to do |format|
      format.turbo_stream
    end
  end

  def update
    topic.update(topic_params)
    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    topic.destroy
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def topic
    @topic ||= Topic.find(params[:id])
  end

  def project
    @project ||= Project.find(params[:project_id])
  end

  def user_in_team
    redirect_back(fallback_location: root_path) unless project.in_team?(current_user)
  end

  def topic_params
    params.require(:topic).permit(:name)
  end
end
