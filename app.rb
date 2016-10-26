require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative ('./controllers/instrument_controller')
require_relative ('./controllers/sales_controller')
require_relative ('./controllers/accessories_controller')
require_relative ('./models/instrument')
require_relative ('./models/sale')
require_relative ('./models/accessories')
# require ('json')

get '/' do
  redirect to('/inventory')
end

get '/inventory' do
  @stock_count = Instrument.stock_count
  @stock_quantity = Instrument.stock_quantity
  @stock_level = Instrument.stock_level
  @instrument_stock_level = Instrument.instrument_stock_level
  @total_instrument_assets = Instrument.total_instrument_assets
  @instrument_markup = Instrument.instrument_markup
  @stock_count_accessories = Accessory.stock_count_accessories
  @stock_quantity_accessories = Accessory.stock_quantity_accessories
  @stock_level_accessories = Accessory.stock_level_accessories
  @accessory_stock_level = Accessory.accessory_stock_level
  @total_accessories_assets = Accessory.total_accessories_assets
  @accessories_markup = Accessory.accessories_markup
  erb(:'/inventory')
end

# get '/inventory/json' do
#     content_type( :json )

#     return results.to_json
# end