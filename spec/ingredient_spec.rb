require("spec_helper")

describe(Ingredient) do
  describe('#recipes') do
    it('returns all the recipes containing the specified ingredient') do
      water = Ingredient.create({:name => 'water'})
      flour = Ingredient.create({:name => 'flour'})
      butter = Ingredient.create({:name => 'butter'})
      water_flour = Recipe.create({:name => "water and flour", :instructions => "mix water and flour together", :rating => nil, :ingredient_ids => [water.id(), flour.id()]})
      water_butter = Recipe.create({:name => "water and butter", :instructions => "mix water and butter together", :rating => nil, :ingredient_ids => [water.id(), butter.id()]})
      butter_flour = Recipe.create({:name => "butter and flour", :instructions => "mix butter and flour together", :rating => nil, :ingredient_ids => [butter.id(), flour.id()]})
      expect(water.recipes()).to eq([water_flour, water_butter])
    end
  end

  it('validates presence of an ingredient name') do
    butter = Ingredient.new({:name => ""})
    expect(butter.save).to eq(false)
  end
end
