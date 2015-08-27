require("spec_helper")

describe(Ingredient) do
  describe('#recipes') do
      it { should have_and_belong_to_many(:recipes) }
      it { should validate_presence_of(:name) }
  end

  it('converts the name to downcased letters') do
    water = Ingredient.create({:name => 'WATER'})
    expect(water.name).to eq('water')
  end
end
