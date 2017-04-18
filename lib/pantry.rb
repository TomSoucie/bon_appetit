class Pantry
  attr_accessor :stock

    def initialize
      @stock = {}
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
end
