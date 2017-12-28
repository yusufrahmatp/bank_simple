class TransactionsController < ApplicationController
  
  before_action :require_user
  before_action :require_same_user

  def add_new
    @transaction = Transaction.new
  end

  def add_create
    @transaction = Transaction.new(trans_type: "Add", amount: params[:transaction][:amount], user_id: current_user.id)
    if @transaction.save
      flash[:success] = "Transaction success"
      current_user.balance += @transaction.amount
      current_user.save
      redirect_to user_path(current_user)
    else
      render 'add_new'
    end
  end

  def withdraw_new
    @transaction = Transaction.new
  end

  def withdraw_create
    @transaction = Transaction.new(trans_type: "Withdraw", amount: params[:transaction][:amount], user_id: current_user.id)
    if @transaction.amount > current_user.balance
      flash[:danger] = "Your balance is not enough"
      render 'withdraw_new'
    else
      if @transaction.save
        flash[:success] = "Transaction success"
        current_user.balance -= @transaction.amount
        current_user.save
        redirect_to user_path(current_user)
      else
        render 'withdraw_new'
      end
    end
  end

  def show
    @user_transactions = current_user.transactions
  end

  private
  def require_same_user
    if current_user != User.find(params[:id])
      flash[:danger] = "You can only do transaction with your own account"
      redirect_to user_path(current_user)
    end
  end
end
