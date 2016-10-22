require_relative('../db/sql_runner')
require ('pry-byebug')

class Instrument

  attr_reader :id, :name, :type, :brand, :cost, :quantity

  def initialize (params)
    @id = params['id'].to_i
    @name = params['name']
    @type = params['type']
    @brand = params['brand']
    @cost = params['cost'].to_i
    @quantity = params['quantity'].to_i
  end

end
