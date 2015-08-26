require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

### Recipes ###

get('/recipes') do
  @recipes = Recipe.all
  @ingredients = Ingredient.all
  erb(:recipes)
end

post('/recipes') do
  name = params.fetch("name")
  instructions = params.fetch("instructions")
  rating = params.fetch("rating").to_i()
  @recipe = Recipe.create({:name => name, :instructions => instructions, :rating => rating})
  redirect back
end

### Ingredients ###

get('/ingredients') do
  @ingredients = Ingredient.all
  erb(:ingredients)
end

post('/ingredients') do
  name = params.fetch("name")
  @ingredient = Ingredient.create({:name => name})
  redirect back
end
