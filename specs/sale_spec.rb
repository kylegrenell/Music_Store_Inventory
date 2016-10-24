require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/sale')
require_relative ('../models/instrument')

def setup
  @sale1 = Sale.new({'customer_id' => customer1.id, 'instrument_id' => guitar1.id})
  @sale2 = Sale.new({'customer_id' => customer2.id, 'instrument_id' => guitar3.id})
  @sales = Sale.new(params)
end


