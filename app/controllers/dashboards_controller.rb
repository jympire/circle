class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @gyms = current_user.gyms
  end
end