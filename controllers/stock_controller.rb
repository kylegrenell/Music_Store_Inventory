require_relative('../models/stock')
require_relative('../models/instrument')

# INDEX
get '/stocks' do
  @stock = Stock.all
  erb(:'stocks/index')
end

# NEW
get '/stocks/new' do
  # @instruments = Instrument.all()
  erb(:'/stocks/new')
end

# CREATE
post '/stocks' do
  @stock = Stock.new(params) 
  redirect to("/stocks")
end

# SHOW
get '/stocks/:id' do
  @stock = Stock.find(params[:id])
  erb(:'/stocks/show')
end

# EDIT
get '/stocks/:id/edit' do
  @stock = Stock.find(params[:id])
  @stocks = Stock.all()
  erb(:'/stocks/edit')
end

# UPDATE
put '/stocks/:id' do
  @stock = Stock.new(params)
  redirect to('/stocks/#{params[:id]}')
end

# DELETE
delete '/stocks/:id do' do
  Stock.delete(params[:id])
  redirect to('/stocks')
end
