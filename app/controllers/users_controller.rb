class UsersController < ApplicationController
  before_action :change_password, except: [ :edit, :sign_in, :sign_out, :updatepas]    
  before_action :authenticate_user!

  def index
    #info about user
    @users = User.where(id: current_user.id)
  end

  def updatepas
    @user = current_user
    @user.pass_check = false
    if @user.update_with_password(user_params)
      # sign in the user by passing validation in case their password changed
      #bypass_sign_in(@user)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def edit
    @user = current_user
  end

  private

  def user_params
    # using `strong_parameters` gem
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
