class Admin::WatersController < ApplicationController
  before_action :authenticate_user!, :admin_in
  def index
    @waters = Water.all 
    @user = User.find(params[:user_id])
    @waters = Water.where(user_id: @user)
  end

  def show
    @water = Water.find(params[:id])
  end

end

