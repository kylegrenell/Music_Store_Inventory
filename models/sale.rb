require ('pg')
require_relative('../db/sql_runner')
require ('pry-byebug')

class Sale

#   attr_reader :id, :instrument_id, :quantity

#   def initialize (params)
#     @id = params['id'].to_i
#     @quantity = params['quantity'].to_i
#     @instrument_id = params['instrument_id'].to_i
#   end

#   def save()
#     sql = "INSERT INTO sales (quantity, instrument_id) VALUES (#{@quantity}, #{@instrument_id}) RETURNING *;"
#     sale = SqlRunner.run(sql).first
#     @id = sale['id'].to_i
#   end

#   def self.all()
#     sql = "SELECT * FROM sales;"
#     return Sale.map_items(sql)
#   end

#   def self.find(id)
#     sql = "SELECT * FROM sales WHERE id =#{id}"
#     return Sale.map_item(sql)
#   end
  

#   def self.map_items(sql)
#     sale = SqlRunner.run(sql)
#     result = sale.map { |s| Sale.new(s) }
#     return result
#   end

#   def self.map_item(sql)
#     result = Sale.map_items(sql)
#     return result.first
#   end

#   def self.delete_all()
#     sql = "DELETE FROM sales;"
#     SqlRunner.run(sql)
#   end

#   def self.delete(id)
#     sql = "DELETE FROM sales WHERE id =#{id};"
#     SqlRunner.run(sql)
#   end

#   def instrument()
#     sql = "SELECT * FROM instruments WHERE id=#{instrument_id};"
#     instrument = SqlRunner.run(sql)
#     result = Instrument.new(instrument.first)
#     return result
#   end


end


