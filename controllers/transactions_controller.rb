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
