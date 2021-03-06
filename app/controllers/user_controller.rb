class UserController < ApplicationController
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render :action => "new"
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to @user
    else
      render :action => "edit"
    end
  end
  
  def show
    @user = User.find(params[:id])
    flash.now[:notice] = "Registration Successful"
  end

  private

  def user_params
    params.require(:user).permit(:name, :contactno, :address, :email, :password, :password_confirmation)
  end
  
end
