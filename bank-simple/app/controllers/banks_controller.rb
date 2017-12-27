class BanksController < ApplicationController

  def index
    @banks = Bank.all
    @bank = Bank.new
  end

  def new
    @bank = Bank.new    
  end

  def create
    @bank = Bank.new(bank_params)
    if @bank.save
      flash[:notice] = "Account was successfully created!"
      @bank.active = "yes"
      @bank.chance = 3
      @bank.hashid = @bank.id.to_s(36)
      @bank.save
      redirect_to banks_path
    else
      redirect_to 'new'
    end
  end


  private
  def bank_params
    params.require(:bank).permit(:username, :password, :balance)
  end

end