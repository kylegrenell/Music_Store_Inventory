require ('pg')
require_relative('../db/sql_runner')
require ('pry-byebug')

class Customer

attr_reader :id, :name, :address, :funds

def initialize(params)
  @id = params['id'].to_i 
  @name = params['name']
  @address = params['address']
  @funds = params['funds'].to_i
end

  def save()
    sql = "INSERT INTO customers (name, address, funds) VALUES ('#{@name}', '#{@address}', #{@funds}) RETURNING *;"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    return Customer.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id=#{id};"
    return Customer.map_item(sql)
  end
  
  def self.map_items(sql)
    customers = SqlRunner.run(sql)
    result = customers.map { |c| Customer.new(c) }
    return result
  end

  def self.map_item(sql)
    result = Customer.map_items(sql)
    return result.first
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM customers WHERE id =#{id};"
    SqlRunner.run(sql)
  end

end


