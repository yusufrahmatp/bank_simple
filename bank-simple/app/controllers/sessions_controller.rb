class SessionsController < ApplicationController

  def new
    redirect_to user_path(current_user) if logged_in?
  end

  def create
    # debugger
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your username or password"
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

end
