require ('pg')
require_relative('../db/sql_runner')
require ('pry-byebug')

class Instrument

  attr_reader :id, :type, :brand, :cost, :quantity

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
    sql = "SELECT * FROM instruments WHERE id = #{id}"
    return Instrument.map_item(sql)
  end
  

  def self.map_items(sql)
    instruments = SqlRunner.run(sql)
    result = instruments.map { |i| Instrument.new( i ) }
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

end
