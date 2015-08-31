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
  @tags = Tag.all
  erb(:recipes)
end

post('/recipes') do
  name = params.fetch("name")
  instructions = params.fetch("instructions")
  rating = params.fetch("rating").to_i()
  @recipe = Recipe.create({:name => name, :instructions => instructions, :rating => rating})
  ingredient_ids = params.fetch('ingredient_ids')
  @recipe.update({:ingredient_ids => ingredient_ids})
  tag_ids = params.fetch('tag_ids')
  @recipe.update({:tag_ids => tag_ids})
  redirect back
end

delete('/recipes/:id/delete') do
  id = params.fetch('id').to_i
  @recipe = Recipe.find(id)
  @recipe.destroy
  redirect back
end

get('/recipes/:id') do
  id = params.fetch('id').to_i
  @recipe = Recipe.find(id)
  @ingredients = Ingredient.all
  @tags = Tag.all
  erb(:recipe)
end


patch("/recipes/:id/update_name") do
  id = params.fetch('id').to_i
  @recipe = Recipe.find(id)
  name = params.fetch('name')
  @recipe.update(:name => name)
  redirect back
end

patch("/recipes/:id/update_instructions") do
  id = params.fetch('id').to_i
  @recipe = Recipe.find(id)
  instructions = params.fetch('instructions')
  @recipe.update(:instructions => instructions)
  redirect back
end

patch('/recipes/:id/add_ingredients') do
  id = params.fetch('id').to_i
  @recipe = Recipe.find(id)
  ingredient_ids = params.fetch('ingredient_ids')
  ingredient_ids.each() do |id|
    ingredient = Ingredient.find(id)
    @recipe.ingredients.push(ingredient)
  end
  redirect back
end

patch('/recipes/:id/update_rating') do
  id = params.fetch('id').to_i
  @recipe = Recipe.find(id)
  rating = params.fetch('rating').to_i
  @recipe.update({:rating => rating})
  redirect back
end

patch('/recipes/:id/add_tags') do
  id = params.fetch('id').to_i
  @recipe = Recipe.find(id)
  tag_ids = params.fetch('tag_ids')
  @recipe.update({:tag_ids => tag_ids})
  redirect back
end


get('/ingredients') do
  @ingredients = Ingredient.all
  erb(:ingredients)
end

post('/ingredients') do
  name = params.fetch("name")
  @ingredient = Ingredient.create({:name => name})
  redirect back
end

get('/ingredients/:id') do
  id = params.fetch('id').to_i
  @ingredient = Ingredient.find(id)
  @recipes = @ingredient.recipes
  erb(:ingredient)
end

delete('/ingredient/:id') do
  id = params.fetch('id').to_i
  @ingredient = Ingredient.find(id)
  @ingredient.destroy
  redirect('/ingredients')
end


####Tag shiiiiiit

get('/tags') do
  @tags = Tag.all
  erb(:tags)
end

post('/tags') do
  name = params.fetch("name")
  @tag = Tag.create({:name => name})
  redirect back
end
