class UsersController < ApplicationController  
  def show
    @user = User.find(params[:id])
    @gyms = @user.gyms
  end 
end