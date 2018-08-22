class WatersController < ApplicationController
  before_action :authenticate_user!, except: [ :show]  
  before_action :change_password
  def index
    @waters = Water.where(user_id: current_user.id)
  end

  def new
    @water = Water.new()
  end

  def create
    @water = Water.new(water_params)
    @water.datein = Time.current
    @water.user_id =current_user.id
    if((Water.where(user_id: current_user.id).last.nil?))
      water_in
    elsif(Water.where(user_id: current_user.id).last.datein.month!=Time.current.month)
         water_in
       else 
         @water.errors.add(:datein, :datein_invalid)
         render :new
      end
  end

  private

  def water_params       
    params.require(:water).permit(:hot, :cold, :datein)
  end

  def water_in
    if (@water.save())
      redirect_to user_waters_path
    else 
      render :new
    end
  end

end
