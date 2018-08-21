class ApplicationController < ActionController::Base
  def admin_in
    if (!current_user.admin?)
      redirect_to users_path
    end
  end

  def change_password 
    @user = current_user
    if (user_signed_in?) 
      if (@user.pass_check? && !@user.admin?) 
        redirect_to edit_user_path(current_user.id)
      end
    end
  end


  def user_in
    if (@user.save())
      redirect_to admin_users_path
    else 
      render :new
    end
  end

  def water_params       
    params.require(:water).permit(:hot, :cold, :datein)
  end

  def user_params       
    params.require(:user).permit(:name, :fname, :address, :email)
  end

  #def after_sign_in_path_for(resource)
  #  if (current_user.pass_check?)
   #   edit_user_path(current_user.id)
    #end
  #end

end
