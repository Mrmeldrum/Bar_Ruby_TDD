class Pub

  attr_accessor :name, :till, :drinks

  def initialize(name, till, drinks)

    @name = name
    @till = till
    @drinks = drinks

  end

  def change_drink(search)
    for drink in @drinks
      if drink[:drink] == search
        drink[:stock] -= 1
      end
    end
  end
  #
  # def change_stock(input_drink)
  #   find_drink(input_drink)
  #
  # end

  def find_drink(search)
    for drink in @drinks
      if drink[:drink] == search
        return drink
      end
    end
  end

  def stock_value()
    total_value = 0
    for drink in @drinks
      total_value += drink[:drink].price * drink[:stock]
    end
    return total_value
  end



end
