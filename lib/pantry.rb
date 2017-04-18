require './lib/recipe'
class Pantry
  attr_reader   :shopping_list
  attr_accessor :stock

    def initialize
      @stock = {}
      @shopping_list = {}
    end
    
    def stock_check(food)
      if @stock.has_key?(food)
        @stock[food]
      else
        0
      end
    end 

    def restock(food, quantity)
      if @stock.has_key?(food)
        @stock[food] += quantity
      else
        @stock[food] = quantity
      end
    end

    def add_to_shopping_list(recipe)
      recipe.ingredients.each_pair do |k, v|
        if @shopping_list.has_key?(k)
          @shopping_list[k] += v
        else
          @shopping_list[k] = v
        end
      end
    end
end
