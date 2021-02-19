class MealsView
  def initialize
  end

  def ask_for_name_and_price
    puts "What is the name of the meal?"
    name = gets.chomp
    puts "What is the price of the meal?"
    price = gets.chomp.to_i
    {name: name, price: price}
  end

  def display_all(meals)
    meals.each_with_index do |meal, index|
      puts "#{meal.id} - #{meal.name} - #{meal.price}"
    end
  end

  def ask_for_id
    puts "What is id of the meal?"
    gets.chomp
  end
end
