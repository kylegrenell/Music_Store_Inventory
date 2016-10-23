require 'pry-byebug'
require_relative('../models/sale')

# INDEX
get '/sales' do
  @sale = Sale.all
  erb(:'/sale/index')
end

# NEW
get '/instruments/new' do
  erb(:'/sale/new')
erb
end

# CREATE
post '/sales' do
  @sale = Sale.new(params)
  @sale.save 
  redirect to("sales")

# SHOW
get '/sales/:id' do
  @sale = Sale.find(params['id'])
  erb(:'/sale/show')
end

# EDIT
get '/sales/:id/edit' do
  @sale = Sale.find(params[:id])
  @sales = Sale.all()
  erb(:'/sale/edit')
end

# UPDATE
put '/sales/:id' do
  @sale = Sale.new(params)
  redirect to('/sales/#{params[:id]}')
end

# DELETE
delete '/sales/:id do'
  Sale.destroy(params[:id])
  redirect to('/sales')
end
