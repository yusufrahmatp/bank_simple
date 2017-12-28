class UsersController < ApplicationController
  
  before_action :require_same_user, except: [:new, :create, :index]

  def index
    if logged_in?
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    if @user.save
      flash[:success] = "Your account was successfully created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(set_params)
      flash[:success] = "Your account was successfully updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def show
    
  end

  private
  def set_params
    params.require(:user).permit(:username, :password, :balance)
  end
  def require_same_user
    @user = User.find(params[:id])
    if current_user != @user
      flash[:danger] = "You can only view/edit your own account"
      redirect_to user_path(current_user)
    end
  end
end
