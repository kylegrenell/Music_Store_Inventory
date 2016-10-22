require_relative('../db/sql_runner')
require ('pry-byebug')

class Sale

  attr_reader :id, :instrument_id, :customer_id

  def initialize (params)
    @id = params['id'].to_i
    @instrument_id = params['instrument_id'].to_i
    @customer_id = params[':customer_id'].to_i
  end

end


