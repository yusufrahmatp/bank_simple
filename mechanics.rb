Account = Struct.new(:name, :pin, :address, :balance, :active)
@acc_data = Hash.new(nil)

def create_account
  loop do
    @acc = Random.rand(1000..9999)
    break if @acc_data[@acc.to_s.to_sym].nil?
  end
  print "Name: "
  name = gets.chomp
  print "PIN: "
  pin = gets.chomp
  print "Address: "
  address = gets.chomp
  print "Initial Balance: "
  balance = gets.chomp
  @acc_data[@acc.to_s.to_sym] = Account.new(name,pin.to_i,address,balance.to_i,true)
end

def admin_print_data
  @acc_data.each do |x,y|
    puts "----------------------------------------------------"
    puts "-------Account no. #{x}-------"
    puts "----------------------------------------------------"
    puts "Name:        #{@acc_data[x][:name]}"
    puts "PIN Number:  #{@acc_data[x][:pin]}"
    puts "Address:     #{@acc_data[x][:address]}"
    puts "Balance:     Rp #{@acc_data[x][:balance]}"
    puts "Active?      #{@acc_data[x][:active]}"
    puts "----------------------------------------------------"
  end
end

def print_data (acc)
    puts "----------------------------------------------------"
    puts "-------Account no. #{acc.to_s}-------"
    puts "----------------------------------------------------"
    puts "Name:        #{@acc_data[acc][:name]}"
    puts "PIN Number:  #{@acc_data[acc][:pin]}"
    puts "Address:     #{@acc_data[acc][:address]}"
    puts "Balance:     Rp #{@acc_data[acc][:balance]}"
    puts "Active?      #{@acc_data[acc][:active]}"
    puts "----------------------------------------------------"
end

def edit_data (acc)
  print_data(acc)
  puts
  puts
  loop do
    puts "Which data do you want to edit? "
    puts "| NAME  PIN  ADDRESS |"
    print ">> "
    input = gets.chomp.downcase

    case input
      when "name"
        puts "Insert your new name"
        print ">> "
        input1 = gets.chomp.capitalize
        @acc_data[acc][:name] = input1
        puts "Name successfuly changed to #{input1}!"

      when "pin"
        loop do
          puts "Insert your new PIN"
          print ">> "
          input1 = Integer(gets.chomp) rescue false
          break if input1
          puts "Invalid input!"
        end
        @acc_data[acc][:pin] = input1
        puts "PIN successfuly changed to #{input1}!"

      when "address"
        puts "Insert your new address "
        print ">> "
        input1 = gets.chomp.capitalize
        @acc_data[acc][:address] = input1
        puts "Address successfuly changed to #{input1}"

      else
        puts "Invalid input!"
    end
    break if input == "name" || input == "pin" || input == "address"
  end
end

def block_account (acc)
  @acc_data[acc][:valid] = false
end
