require( 'sinatra' )
require( 'sinatra/contrib/all')
require( 'pry' )
require_relative( '../models/category.rb' )
also_reload( '../models/*' )


#READ - all/index
get '/categories' do
  @categories=Category.all()
  erb(:"categories/index")
end

#NEW
get '/categories/new' do
erb(:"categories/new")
end
