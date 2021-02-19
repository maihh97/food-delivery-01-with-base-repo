require_relative "../models/meal"
require_relative "base_repository"

class MealRepository < BaseRepository

  private

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:name] = row[:name]
    row[:price] = row[:price].to_i
    Meal.new(row)
  end
end

