require ('pg')
require_relative('../db/sql_runner')
require ('pry-byebug')

class Sale

  attr_reader :id, :instrument_id, :customer_id

  def initialize (params)
    @id = params['id'].to_i
    @instrument_id = params['instrument_id'].to_i
    @customer_id = params['customer_id'].to_i
  end

  def save()
    sql = "INSERT INTO sales (instrument_id, customer_id) VALUES (#{@instrument_id}, #{@customer_id}) RETURNING *;"
    sale = SqlRunner.run(sql).first
    @id = sale['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM sales;"
    return Sale.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM sales WHERE id = #{id}"
    return Sale.map_item(sql)
  end
  

  def self.map_items(sql)
    sales = SqlRunner.run(sql)
    result = sales.map { |s| Sale.new(s) }
    return result
  end

  def self.map_item(sql)
    result = Sale.map_items(sql)
    return result.first
  end

  def self.delete_all()
    sql = "DELETE FROM sales;"
    SqlRunner.run(sql)
  end

end


