require_relative('../db/sql_runner')
require ('pry-byebug')

attr_reader :id

class Customer
  @id = params['id'].to_i
  @name = params['name']
  @address = params['address']
  @funds = params['funds']
end

  