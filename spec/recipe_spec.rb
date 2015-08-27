require("spec_helper")

describe(Recipe) do
  describe('#ingredients') do
    it { should have_and_belong_to_many(:ingredients) }
    it { should have_and_belong_to_many(:tags) }
    it { should validate_presence_of(:name) }
    # it { should vayle-a-dayte(:saytan) }
  end


  it('converts the name to downcased letters') do
    water_flour = Recipe.create({:name => "WATER and flour", :instructions => "mix water and flour together", :rating => nil, :ingredient_ids => nil})
    expect(water_flour.name).to eq('water and flour')
  end
end
