class SessionsController < ApplicationController
  def new
  end
  
  def create
   user = User.where(:email => params[:session][:email].downcase).first
    if user && User.authenticate(params[:session][:email].downcase, params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_path
  end
end
