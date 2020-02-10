require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/category.rb' )
also_reload( '../models/*' )

# READ ALL INDEX
get '/transactions' do
  @transactions = Transaction.all
  erb ( :"transactions/index" )
end

#NEW
get '/transactions/new' do
erb(:"transactions/new")
end

# # SHOW
# get '/merchants/:id' do
#   @transaction = Transaction.find(params[:id])
#   erb(:"transactions/show")
# end
