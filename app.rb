require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative ('./controllers/instrument_controller')
require_relative ('./controllers/sales_controller')
require_relative ('./controllers/accessories_controller')
require_relative ('./models/instrument')
require_relative ('./models/sale')
require_relative ('./models/accessories')

get '/' do
  redirect to('/inventory')
end

get '/inventory' do
  @stock_count = Instrument.stock_count
  @stock_quantity = Instrument.stock_quantity
  @stock_level = Instrument.stock_level
  @instrument_stock_level = Instrument.instrument_stock_level

  erb(:'/inventory')
end