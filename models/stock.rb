require ('pg')
require_relative('../db/sql_runner')
require ('pry-byebug')

class Stock

  attr_reader :id, :instrument_id, :quantity

  def initialize (params)
    @id = params['id'].to_i
    @quantity = params['quantity'].to_i
    @instrument_id = params['instrument_id'].to_i
  end

  def save()
    sql = "INSERT INTO stocks (quantity, instrument_id) VALUES (#{@quantity}, #{@instrument_id}) RETURNING *;"
    sale = SqlRunner.run(sql).first
    @id = sale['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM stocks;"
    return Stock.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM stocks WHERE id =#{id}"
    return Stock.map_item(sql)
  end
  

  def self.map_items(sql)
    stock = SqlRunner.run(sql)
    result = stock.map { |s| Stock.new(s) }
    return result
  end

  def self.map_item(sql)
    result = Stock.map_items(sql)
    return result.first
  end

  def self.delete_all()
    sql = "DELETE FROM stocks;"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM stocks WHERE id =#{id};"
    SqlRunner.run(sql)
  end

  def instrument()
    sql = "SELECT * FROM instruments WHERE id=#{instrument_id};"
    instrument = SqlRunner.run(sql)
    result = Instrument.new(instrument.first)
    return result
  end

  def buy()
    @sell += 1
    update()
  end

  def sell()
    @sell -= 1
    update()
  end

  def number_of_sales()
    return stock().count
  end
    
  def order_new_stock(quantity)
    return quantity <= 5
    puts "Low"
  end

  def stock_medium(quantity)
    return quantity <= 10
  end

  def stock_high(quantity)
    return quantity <= 15
  end

end


