class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @notifications_by_month = current_user.notifications.order(created_at: :desc).group_by { |m| m.created_at.beginning_of_month}
  end
end
