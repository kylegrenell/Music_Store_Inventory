require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative ('./controllers/instrument_controller')
require_relative ('./controllers/stock_controller')
require_relative ('./models/instrument')
require_relative ('./models/stock')

get '/' do
  redirect to('/inventory')
end

get '/inventory' do
  erb(:'/inventory')
end