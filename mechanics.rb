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
  @acc_data[@acc.to_s.to_sym] = Account.new(name,pin.to_i,address,balance,true)
end

def admin_print_data
  @acc_data.each do |x,y|
    puts @acc_data[x][:name]
    puts @acc_data[x][:pin]
    puts @acc_data[x][:address]
    puts @acc_data[x][:balance]
    puts @acc_data[x][:active]
  end
end


  puts "Bikin acc"
  create_account
  create_account
  admin_print_data
