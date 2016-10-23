require 'pry-byebug'
require_relative('../models/instrument')

# INDEX
get '/instruments' do
  @instrument = Instrument.all
  erb(:'instrument/index')
end

# NEW
get '/instruments/new' do
  erb(:'instrument/new')
erb
end

# CREATE
post '/instruments' do
  @instrument = Instrument.new(params)
  @instrument.save 
  redirect to("instruments")

# SHOW
get '/instruments/:id' do
  @instrument = Instrument.find(params['id'])
  erb(:'instrument/show')
end

# EDIT
get '/instruments/:id/edit' do
  @instrument = Instrument.find(params[:id])
  @sales = Sales.all()
  erb(:'instrument/edit')
end

# UPDATE
put '/instruments/:id' do
  @instrument = Instrument.new(params)
  redirect to('/instruments/#{params[:id]}')
end

# DELETE
delete '/instruments/:id do'
  Instrument.destroy(params[:id])
  redirect to('/instruments')
end

