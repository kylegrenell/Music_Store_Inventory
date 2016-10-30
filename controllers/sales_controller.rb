require_relative('../models/sale')
require ('pry-byebug')

# INDEX
get '/sales' do
  @instrument = Instrument.all
  erb(:'/sales/index')
end