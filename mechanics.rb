Account = Struct.new(:name, :pin, :address, :balance, :active)
@acc_data = Hash.new(nil)
@cur_acc = nil

def create_account
  loop do
    @acc = Random.rand(1000..9999)
    break if @acc_data[@acc.to_s.to_sym].nil?
  end
  @cur_acc=@acc.to_s.to_sym
  print "Name: "
  name = gets.chomp
  require 'io/console'
  print "PIN: "
  pin = STDIN.noecho(&:gets).chomp
  puts
  print "Address: "
  address = gets.chomp
  print "Initial Balance: "
  balance = gets.chomp
  @acc_data[@acc.to_s.to_sym] = Account.new(name,pin.to_i,address,balance.to_i,true)
end

def admin_print_data
  @acc_data.each do |x,y|
    puts "Account no. #{x}"
    puts @acc_data[x][:name]
    puts @acc_data[x][:pin]
    puts @acc_data[x][:address]
    puts @acc_data[x][:balance]
    puts @acc_data[x][:active]
  end
end


def add_balance(noacc)
  print "Balance : "
  loop do
    addbalance = Integer(gets.chomp) rescue false
    break if addbalance
    puts "Invalid input"
  end
  @acc_data[noacc][:balance]+=addbalance.to_i
  puts "Success"
end


def withdraw_balance(noacc)
  loop do
    print "Balance : "
    loop do
      withdraw = Integer(gets.chomp) rescue false
      break if withdraw
      puts "Invalid input"
    end
    break if withdraw <= @acc_data[noacc][:balance]
    puts "Balance isn't enough"
  end
  @acc_data[noacc][:balance]-=withdraw
  puts "Withdraw success"
end

def login
  chance =Hash.new(3)
  loop do
    loop do
      print "No. Acc : "
      noacc = Integer(gets.chomp) rescue false
      break if noacc && !@acc_data[noacc.to_i.to_sym].nil?
      puts "Invalid account number"
    end
    chance[noacc.to_i.to_sym]=3
    print "PIN : "
    pin = Integer(gets.chomp) rescue false
    break if pin==@acc_data[noacc.to_i.to_sym][:pin]
    chance[noacc.to_i.to_sym] -= 1
    if chance[noacc.to_i.to_sym]==0
      puts "Account is blocked"
    else
      puts "Invalid pin, Chance remaining : #{chance[noacc.to_i.to_sym]}"
    end
  end
  if chance[noacc.to_i.to_sym]>0
    @cur_acc=noacc.to_i.to_sym
    puts "Login success"
  else
    puts "Login failed"
  end
end

