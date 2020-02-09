require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative( '../models/merchant.rb' )
also_reload( '../models/*' )

#READ - all/index
get "/merchants" do
  @merchants=Merchant.all()
  erb(:"merchants/index")
end

#NEW
get '/merchants/new' do
erb(:"merchants/new")
end

# SHOW
get '/merchants/:id' do
  @merchant = Merchant.find(params[:id])
  erb(:"merchants/show")
end

#CREATE
post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save()
  erb(:"merchants/create")
end

#EDIT
get '/merchants/:id/edit' do
@merchant=Merchant.find(params[:id])
erb(:"merchants/edit")
end


#UPDATE
post '/merchants/:id' do
  @merchant = Merchant.new(params)
  @merchant.update
  redirect "/merchants/#{@merchant.id}"
end
