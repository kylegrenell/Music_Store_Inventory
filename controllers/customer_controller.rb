require_relative('../models/customer')

# INDEX
get '/customers' do
  @customer = Customer.all
  erb(:'/customer/index')
end

# NEW
get '/customers/new' do
  erb(:'/customer/new')
end

# CREATE
post '/customers' do
  @customer = Customer.new(params)
  @customer.save 
  redirect to('/customers')
end

# SHOW
get '/customers/:id' do
  @customer = Customer.find(params[:id])
  erb(:'/customer/show')
end

# EDIT
get '/customers/:id/edit' do
  @customer = Customer.find(params[:id])
  @sales = Customer.all()
  erb(:'/customer/edit')
end

# UPDATE
put '/customers/:id' do
  @customer = Customer.new(params)
  redirect to('/customers/#{params[:id]}')
end

# DELETE
delete '/customers/:id' do
  Customer.delete(params[:id])
  redirect to('/customers')
end



