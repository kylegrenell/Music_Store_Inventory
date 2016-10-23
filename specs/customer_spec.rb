require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/customer')

class TestCustomer < Minitest::Test

  def setup
    @customer1 = Customer.new({'name' => 'Moe', 'address' => '21 Stooge Street, Edinburgh', 'funds' => 2000})
    @customer2 = Customer.new({'name' => 'Larry', 'address' => '23 Stooge Street, Edinburgh', 'funds' => 3000})
    @customer3 = Customer.new({'name' => 'Curly', 'address' => '25 Stooge Street, Edinburgh', 'funds' => 4000})
  end

  def test_customer_name
    assert_equal('Moe', @customer1.name)
  end

  def test_customer_address
    assert_equal('23 Stooge Street, Edinburgh', @customer2.address)
  end

  def test_customer_funds
    assert_equal(4000, @customer3.funds)
  end

 

end