require 'pry-byebug'
require_relative('../models/sale')
require('json')

# INDEX
get '/sales' do
  @sales = Sale.all
  erb(:'/sale/index')
end

# NEW
get '/sales/new' do
  erb(:'/sale/new')
end

# CREATE
post '/sales' do
  @sales = Sale.new(params)
  @sale.save 
  redirect to("sales")

# SHOW
get '/sales/:id' do
  @sales = Sale.find(params[:id])
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
  @sales = Sale.new(params)
  redirect to('/sales/#{params[:id]}')
end

# DELETE
delete '/sales/:id do'
  Sale.delete(params[:id])
  redirect to('/sales')
end
