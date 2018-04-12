class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredients_attributes)
    # puts ingredients_attributes
    self.ingredients << Ingredient.find_or_create_by(
      name: ingredients_attributes['0']['name'],
      quantity: ingredients_attributes['0']['quantity']
    )

    self.ingredients << Ingredient.find_or_create_by(
      name: ingredients_attributes['1']['name'],
      quantity: ingredients_attributes['1']['quantity']
    )
  end
end
