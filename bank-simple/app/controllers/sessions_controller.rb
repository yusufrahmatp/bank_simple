class SessionsController < ApplicationController

  def new
    redirect_to user_path(current_user) if logged_in?
  end

  def create
    # debugger
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password]) && user.active == "yes"
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      user.chance = 3
      user.save
      redirect_to user_path(user)
    elsif user && user.active == "yes"
      user.chance -= 1
      if user.chance == 0
        user.active = "no"
      end
      user.save
      flash.now[:danger] = "There was something wrong with your username or password"
      render 'new'
    elsif user && user.active == "no"
      flash.now[:danger] = "Your account was freezed because of too many failed login"
      render 'new'
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
