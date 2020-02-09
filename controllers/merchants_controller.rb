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
  @merchants = Merchant.find(params[:id])
  erb(:"merchants/show")
end
