require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/instrument')

class TestCustomer < Minitest::Test

  def setup
    @guitar1 = Instrument.new({'brand' => "Fender 52 Reissue", 'type' => "Electric Guitar", 'cost' => 1499, 'quantity' => 10})
    @instrument = Instrument.new(guitar1)
  end

  def test_instrument_name
    assert_equal('Fender 52 Reissue', @guitar1.brand)
  end

  def test_instrument_cost
    assert_equal(925, @kit1.cost)
  end

  def test_instrument_type
    assert_equal('Bass', @bass2.type)
  end

  def test_instrument_quantity
    assert_equal(5, @guitar3.quantity)
  end

  # def test_instrument_count
  #   assert_equal(201, @Instrument.new)
  # end

end