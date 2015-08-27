class Tag < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)

  validates(:name, {:presence => true, :length => { :maximum => 15 }})
  before_save(:downcase_name)

private
  define_method(:downcase_name) do
    self.name = name.downcase
  end
end
