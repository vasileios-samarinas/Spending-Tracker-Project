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
  @categories = Category.all
  @merchants = Merchant.all
  @total = Transaction.total_amount
  erb ( :"transactions/index" )
end

#NEW
get '/transactions/new' do
  @categories = Category.all
  @merchants = Merchant.all
  erb(:"transactions/new")
end

# SHOW
get '/transactions/:id' do
  @transactions = Transaction.find(params[:id])
  erb(:"transactions/show")
end

#CREATE
post '/transactions' do
  @transactions = Transaction.new(params)
  @transactions.save()
  erb(:"transactions/create")
end

#EDIT
get '/transactions/:id/edit' do
@transaction=Transaction.find(params[:id])
@categories = Category.all()
@merchants=Merchant.all()
erb(:"transactions/edit")
end

#UPDATE
post '/transactions/:id' do
  @transaction = Transaction.new(params)
  @transaction.update()
  redirect "/transactions/#{@transaction.id}"
end

#DELETE
post '/transactions/:id/delete' do
  transaction=Transaction.find( params[:id] )
  transaction.delete()
  redirect to '/transactions'
end

# FILTER TRANSACTION BY MERCHANT
# post '/transactions/filter-by-merchant' do
#   @filter = Merchant.find(params["merchant_id"]).name()
#   @transactions = Transaction.filter_by_merchant(params["merchant_id"])
#   @merchants = Merchant.all
#   @categories = Category.all
#   erb ( :"transactions/index" )
# end
