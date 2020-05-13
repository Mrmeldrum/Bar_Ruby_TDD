require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')
require_relative('../customer')
require_relative('../pub')
require_relative('../food')

class PubTest < MiniTest::Test

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

  def test_total_stock_value
    assert_equal(14, @pub1.stock_value)
  end

end
