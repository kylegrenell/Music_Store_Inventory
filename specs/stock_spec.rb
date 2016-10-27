require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/stock')
require_relative ('../models/instrument')
require_relative ('../inventory')

class TestCustomer < Minitest::Test

def setup()
  @stock1 = Stock.new({'instrument_id' => 1, 'quantity' => 10 })
  @stock2 = Stock.new({'instrument_id' => 2, 'quantity' => 20 })

end

def test_stock_count()
  assert_equal(10, @stock1.quantity)
end

end
