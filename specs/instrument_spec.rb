require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/instrument')

class TestCustomer < Minitest::Test

  def setup
    @guitar1 = Instrument.new({'brand' => "Fender 52 Reissue", 'type' => "Electric Guitar", 'cost' => 1499, 'quantity' => 10})
    @guitar2 = Instrument.new({'brand' => "Fender Stratocaster", 'type' => "Electric Guitar", 'cost' => 499, 'quantity' => 10})
    @guitar3 = Instrument.new({'brand' => "Gibson ES-335", 'type' => "Electric Guitar", 'cost' => 2999, 'quantity' => 5})
    
    @bass1 = Instrument.new({'brand' => "Fender Deluxe Active P Special", 'type' => "Bass", 'cost' => 785, 'quantity' => 10})
    @bass2 = Instrument.new({'brand' => "Sterling by Music Man", 'type' => "Bass", 'cost' => 799, 'quantity' => 10})
    @bass3 = Instrument.new({'brand' => "Yamaha BB Series BB424", 'type' => "Bass", 'cost' => 399, 'quantity' => 15})

    @kit1 = Instrument.new({'brand' => "Ludwig Club Date ", 'type' => "Drums", 'cost' => 925, 'quantity' => 5})
    @kit2 = Instrument.new({'brand' => "Gretsch Catalina", 'type' => "Drums", 'cost' => 800, 'quantity' => 6})
    @kit3 = Instrument.new({'brand' => "Pearl Export Series", 'type' => "Drums", 'cost' => 785, 'quantity' => 7})

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