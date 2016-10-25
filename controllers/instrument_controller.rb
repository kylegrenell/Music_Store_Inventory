require_relative('../models/instrument')

# INDEX
get '/instruments' do
  @instrument = Instrument.all
  erb(:'/instrument/index')
end

# NEW
get '/instruments/new' do
  @instruments = Instrument.all()
  erb(:'/instrument/new')
end

# CREATE
post '/instruments' do
  @instrument = Instrument.new(params)
  @instrument.save 
  redirect to("/instruments")

# SHOW
get '/instruments/:id' do
  @instrument = Instrument.find(params[:id])
  erb(:'/instrument/show')
end

# EDIT
get '/instruments/:id/edit' do
  id = params['id']
  @instrument = Instrument.find(id)
  erb(:'/instrument/edit')
end

# UPDATE 
post '/artists/:id' do
  id = params['id']
  instrument = Instrument.new(params)
  instrument.update()
  redirect to('/instruments')
end


# DELETE
delete '/instruments/:id do'
  Instrument.delete(params[:id])
  redirect to('/instruments')
end

