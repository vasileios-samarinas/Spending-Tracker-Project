require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/category.rb' )
also_reload( '../models/*' )

get 'categories' do
  @categories=Category.all()
  erb(:"categories/index")
end

get '/categories/:id' do
  @category = Category.find(params['id'].to_i)
  erb(:"categories/show")
end
