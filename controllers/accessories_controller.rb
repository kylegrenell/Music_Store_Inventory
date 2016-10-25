require_relative('../models/accessories')
require ('pry-byebug')

# INDEX
get '/accessories' do
  @accessory = Accessory.all
  erb(:'/accessory/index')
end

# NEW
get '/accessories/new' do
  @accessories = Accessory.all()
  erb(:'/accessory/new')
end

# CREATE
post '/accessories' do
  @accessory = Accessory.new(params)
  @accessory.save 
  redirect to("/accessories")
end

# SHOW
get '/accessories/:id' do
  @accessory = Accessory.find(params[:id])
  erb(:'/accessory/show')
end

# EDIT
get '/accessories/:id/edit' do
  @accessory = Accessory.find(params[:id])
  erb(:'/accessory/edit')
end


# UPDATE 
put '/accessories/:id' do
  accessory = Accessory.find(params[:id])
  accessory.update(params)
  redirect to("/accessories/#{params[:id]}")
end

# DELETE
delete '/accessories/:id' do
  Accessory.delete(params[:id])
  redirect to('/accessories')
end

