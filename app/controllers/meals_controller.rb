require_relative "../views/meals_view"
require_relative "../models/meal"

class MealsController

  def initialize(repo)
    @meal_repo = repo
    @view = MealsView.new
  end


  def list
    meals = @meal_repo.all
    @view.display_all(meals)
  end

  def add
    #should ask the user for a name and price, then store the new meal
    answer = @view.ask_for_name_and_price
    meal = Meal.new(answer)
    @meal_repo.create(meal)
  end


  def edit
    id = @view.ask_for_id.to_i
    answer = @view.ask_for_name_and_price
    meal = Meal.new(answer)
    @meal_repo.update(id, meal)
  end

  def destroy(id)
    id = @view.ask_for_id.to_i
    @meal_repo.destroy(id)
  end
end
