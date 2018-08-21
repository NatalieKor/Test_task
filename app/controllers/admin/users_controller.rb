class Admin::UsersController < ApplicationController
    before_action :authenticate_user!, :admin_in
  def index
    # список всех пользователей
    @users = User.where(admin: false)
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    @user.password =@user.name+@user.fname
    user_in
  end

  def show
     @user = User.find(Water.find(params[:id]).user_id)
  end

  def hot_liders
    @waters_hot = Water.where("datein >= ? AND datein <= ?",Time.zone.now.beginning_of_month, Time.zone.now.end_of_month).order("hot DESC").limit(3)  
  end

  def cold_liders
    @waters_cold = Water.where("datein >= ? AND datein <= ?",Time.zone.now.beginning_of_month, Time.zone.now.end_of_month).order("cold DESC").limit(3)  
  end

private
  def user_in
    if (@user.save())
      redirect_to admin_users_path
    else 
      render :new
    end
  end

end
