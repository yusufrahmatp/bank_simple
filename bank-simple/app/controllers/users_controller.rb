class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def show
    
  end
  private
  def set_params
    params.require(:user).permit(:username, :password, :balance)
  end

end
