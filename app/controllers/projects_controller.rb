class ProjectsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :user_in_team, only: :show
  before_action :user_not_in_team, only: :join

  def index
    @projects = Project.where.not(id: current_user.projects.ids).order(finish_at: :asc) 
  end

  def show
    @users = project.users 
    @topics = project.topics
  end

  def join
    project.users << current_user
    redirect_to project
  end

  private

  def project
    @project ||= Project.find(params[:id])
  end

  def user_in_team
    redirect_back(fallback_location: root_path) unless project.in_team?(current_user)
  end

  def user_not_in_team
    redirect_back(fallback_location: root_path) if project.in_team?(current_user)
  end
end
