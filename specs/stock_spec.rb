require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/sale')
require_relative ('../models/instrument')
require_relative ('../models/accessory')

class TestCustomer < Minitest::Test

def setup()
  @stock1 = Stock.new({'instrument_id' => 1, 'accessory_id' => 10 })
  @stock2 = Stock.new({'instrument_id' => 2, 'accessory_id' => 20 })

end

def test_stock_count()
  assert_equal(10, @stock1.quantity)
end

end
