require 'byebug'
class CustomersView
  def initialize
  end

  def ask_for_name_and_address
    puts "What is the name of the customer?"
    name = gets.chomp
    puts "What is the address of the customer?"
    address = gets.chomp
    {name: name, address: address}
  end

  def display_all(customers)
    customers.each_with_index do |customer, index|
      puts "#{customer.id} - #{customer.name} - #{customer.address}"
    end
  end

  def ask_for_id
    puts "What is id of the customer?"
    gets.chomp
  end
end
