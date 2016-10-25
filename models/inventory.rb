require ('pg')
require_relative('../db/sql_runner')
require ('pry-byebug')

attr_reader :id, :sales, :instruments, :sell_stock

class Inventory

  def initialize(params)
    @id = params['id'].to_i
    @sales = Sales.new(params)
    @instruments = Instruments.new(params)
    @sell_stock = params['sell_stock'].to_i
  end



  def stock_count()
    return sales().count
  end

  def buy_instrument(params)
    instrument = instrument.id
    cost = instrument.cost
    return unless instrument.quantity > 0
    Instrument.new('instrument_id' => instrument.id).save
    @instrument.cost -= price
    instrument.sell_stock()
    update()
  end



end