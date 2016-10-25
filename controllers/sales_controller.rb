require_relative('../models/sale')
# require_relative('../models/instrument')

# INDEX
get '/sales' do
  @sale = Sale.all
  erb(:'sales/index')
end

# NEW
get '/sales/new' do
  # @instruments = Instrument.all()
  erb(:'/sales/new')
end

# CREATE
post '/sales' do
  @sale = Sale.new(params) 
  redirect to("/sales")
end

# SHOW
get '/sales/:id' do
  @sale = Sale.find(params['id'])
  erb(:'/sales/show')
end

# EDIT
get '/sales/:id/edit' do
  @sale = Sale.find(params['id'])
  @sales = Sale.all()
  erb(:'/sales/edit')
end

# UPDATE
put '/sales/:id' do
  @sale = Sale.new(params)
  redirect to('/sales/#{params[:id]}')
end

# DELETE
delete '/sales/:id do' do
  Sale.delete(params['id'])
  redirect to('/sales')
end
