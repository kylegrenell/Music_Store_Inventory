require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative ('./controllers/customer_controller')
require_relative ('./controllers/instrument_controller')
require_relative ('./controllers/sales_controller')
require_relative ('./models/customer')
require_relative ('./models/instrument')
require_relative ('./models/sale')

get '/' do
  erb(:home)
end
