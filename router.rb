class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      print_menu
      choice = gets.chomp.to_i
      print `clear`
      route_action(choice)
    end
  end

  private

  def print_menu
    puts "Hello there"
    puts "------- MENU -------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. Update a Meal"
    puts "6. Update a Customer"
    puts "7. Exit"
  end

  def route_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @meals_controller.edit
    when 6 then @customers_controller.edit
    when 7 then stop!
    else puts "Try again..."
    end
  end

  def stop!
    @running = false
  end
end
