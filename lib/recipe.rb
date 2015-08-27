class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:tags)

  validates(:name, {:presence => true, :length => { :maximum => 50 }})
  before_save(:downcase_name)

private
  define_method(:downcase_name) do
    self.name = name.downcase
  end
end
