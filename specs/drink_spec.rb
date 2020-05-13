require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')
require_relative('../customer')
require_relative('../pub')
require_relative('../food')

class DrinkTest < MiniTest::Test

  def setup()
    @customer1 = Customer.new("Stuart", 27, 27)
    @drink1 = Drink.new("Rum", 1)
    @drink2 = Drink.new("Vodka", 4)

    @pub1 = Pub.new("Juanpub", 200, [@drink1,@drink2]
  end

end
