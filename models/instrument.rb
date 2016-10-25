require ('pg')
require_relative('../db/sql_runner')
require ('pry-byebug')

class Instrument

  attr_reader(:id, :type, :brand, :cost, :quantity)

  def initialize (params)
    @id = params['id'].to_i
    @brand = params['brand']
    @type = params['type']
    @cost = params['cost'].to_i
    @quantity = params['quantity'].to_i
  end

  def save()
    sql = "INSERT INTO instruments (brand, type, cost, quantity) VALUES ('#{@brand}', '#{@type}', #{@cost}, #{@quantity}) RETURNING *;"
    instrument = SqlRunner.run(sql).first
    @id = instrument['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM instruments;"
    return Instrument.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM instruments WHERE id =#{id};"
    return Instrument.map_item(sql)
  end
  
  def update(params)
      sql = (  
        "UPDATE instruments SET 
          brand='#{params['brand']}',
          type='#{params['type']}',
          cost=#{params['cost']},
          quantity=#{params['quantity']}
          WHERE id=#{params['id']} RETURNING *;"
      ) 
      SqlRunner.run(sql)
  end

  def self.map_items(sql)
    instruments = SqlRunner.run(sql)
    result = instruments.map {|i| Instrument.new(i)}
    return result
  end

  def self.map_item(sql)
    result = Instrument.map_items(sql)
    return result.first
  end

  def self.delete_all()
    sql = "DELETE FROM instruments;"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM instruments WHERE id =#{id};"
    SqlRunner.run(sql)
  end

  def self.stock_quantity()
    sql = "SELECT SUM(quantity) FROM instruments;"
    result = SqlRunner.run(sql)
    return result.first['sum'].to_i
  end

  def self.stock_count()
    sql = "SELECT COUNT (*) FROM instruments;"
    result = SqlRunner.run(sql)
    return result.first['count'].to_i
  end

  def self.stock_level()
    number = self.stock_count
    case number
    when (0..5)
      return ("Stock levels are LOW")
    when (6..15)
      return ("Stock levels are MEDIUM")
    when (16..30)
      return ("Stock levels are HIGH")
    else
      return ("Rest your wallet Rick, get out there and SELL SELL SELL")
    end
  end

  def self.instrument_stock_level()
    number = self.stock_quantity
    case number
    when (0..5)
      return ("Stock levels are LOW")
    when (6..15)
      return ("Stock levels are MEDIUM")
    when (16..30)
      return ("Stock levels are HIGH")
    else
      return ("Rest your wallet Rick, get out there and SELL SELL SELL")
    end
  end


end
