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

# SHOW
get '/categories/:id' do
  @category = Category.find(params[:id])
  erb(:"categories/show")
end

#CREATE
post '/categories' do
  @category = Category.new(params)
  @category.save()
  erb(:"categories/create")
end


#EDIT
get '/categories/:id/edit' do
@category=Category.find(params[:id])
erb(:"categories/edit")
end


#UPDATE
post '/categories/:id' do
  @category = Category.new(params)
  @category.update
  redirect "/categories/#{@category.id}"
end

#DELETE

post '/categories/:id/delete' do
  category=Category.find( params[:id] )
  category.delete()
  redirect to '/categories'
end
