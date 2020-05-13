require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')
require_relative('../customer')
require_relative('../pub')
require_relative('../food')

class CustomerTest < MiniTest::Test

  def setup()

    @customer1 = Customer.new("Stuart", 27, 27)
    @customer2 = Customer.new("Matt", 27, 7)
    @customer3 = Customer.new("Niall", 27, 30)
    @drink1 = Drink.new("Rum", 1 , 3)
    @drink2 = Drink.new("Vodka", 4, 2)
    @pub1 = Pub.new("Juanpub", 200,
      [{
        drink: @drink1,
        stock:2},
        {
          drink: @drink2,
          stock: 3
        }
        ])
    @food1 = Food.new("Dawgs", 3, 3)
  end

  def test_customer_can_buy_drink

    @customer1.buy_drink(@pub1,@drink1)

    assert_equal(26, @customer1.wallet)
    assert_equal(201, @pub1.till)
  end

  def test_customer_too_young
    @customer2.buy_drink(@pub1,@drink1)

    assert_equal(27, @customer1.wallet)
    assert_equal(200, @pub1.till)
  end

  def test_customer_too_pissed

    @customer1.buy_drink(@pub1,@drink1)
    @customer1.buy_drink(@pub1,@drink2)
    @customer1.buy_drink(@pub1,@drink1)

    assert_equal(22, @customer1.wallet)
    assert_equal(205, @pub1.till)
  end

 def test_customer_can_buy_food
   @customer1.buy_drink(@pub1,@drink1)
   @customer1.buy_drink(@pub1,@drink2)
   @customer1.buy_food(@pub1,@food1)
   @customer1.buy_food(@pub1,@food1)

   assert_equal(16, @customer1.wallet)
   assert_equal(211, @pub1.till)
   assert_equal(-1, @customer1.drunkness)
 end

 def test_stock_drinks
   @customer1.buy_drink(@pub1,@drink1)

   assert_equal(1, @pub1.drinks[0][:stock])
 end

 def test_stock_depleted
   @customer1.buy_drink(@pub1,@drink1)
   @customer1.buy_drink(@pub1,@drink1)
   @customer3.buy_drink(@pub1,@drink1)

   assert_equal(0, @pub1.drinks[0][:stock])


 end

end
