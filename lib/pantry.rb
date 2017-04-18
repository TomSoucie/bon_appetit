class Pantry
  attr_reader :stock

    def initialize
      @stock = {}
    end
    
    def stock_check(food)
      if @stock.has_key?(food)
        @stock[food].count
      else
        0
      end
    end 

end
