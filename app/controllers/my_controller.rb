class MyController < ApplicationController
  before_action :authenticate_user!
  before_action :user

  def show; end

  def projects
    @projects = @user.projects.order(finish_at: :desc) 
  end

  private

  def user
    @user ||= current_user
  end
end
