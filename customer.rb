class Customer

  attr_accessor :name, :wallet, :age, :drunkness

  def initialize(name, wallet, age)

    @name = name
    @wallet = wallet
    @age = age
    @drunkness = 0

  end

  def buy_drink(pub ,drink)

    if pub.find_drink(drink)[:stock] > 0
      if @age >= 18 && @drunkness <= 4
        @wallet -= drink.price
        pub.till += drink.price
        @drunkness += drink.units
        pub.change_drink(drink)
      end
    end
  end

  def buy_food(pub,food)
    @wallet -= food.price
    @drunkness -= food.rejuv_level
    pub.till += food.price
  end




end
