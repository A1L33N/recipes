require("spec_helper")

describe(Recipe) do
  describe('#ingredients') do
    it('returns all the ingredients in a recipe') do
      water = Ingredient.create({:name => 'water'})
      flour = Ingredient.create({:name => 'flour'})
      butter = Ingredient.create({:name => 'butter'})
      water_flour = Recipe.create({:name => "water and flour", :instructions => "mix water and flour together", :rating => nil, :ingredient_ids => [water.id(), flour.id()]})
      water_butter = Recipe.create({:name => "water and butter", :instructions => "mix water and butter together", :rating => nil, :ingredient_ids => [water.id(), butter.id()]})
      butter_flour = Recipe.create({:name => "butter and flour", :instructions => "mix butter and flour together", :rating => nil, :ingredient_ids => [butter.id(), flour.id()]})
      expect(water_flour.ingredients()).to eq([water, flour])
    end
  end

  it('validates presence of recipe name') do
    no_name = Recipe.new({:name => "", :instructions => "do nothing", :rating => nil, :ingredient_ids => nil})
    expect(no_name.save()).to eq(false)
  end

  it('converts the name to downcased letters') do
    water_flour = Recipe.create({:name => "WATER and flour", :instructions => "mix water and flour together", :rating => nil, :ingredient_ids => nil})
    expect(water_flour.name).to eq('water and flour')
  end
end
