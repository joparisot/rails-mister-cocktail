# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

ingredients_hash = JSON.parse(open(url).read)
ingredients_array = ingredients_hash["drinks"]

ingredients_array.each do |ingredient_hash|
  # p ingredient_hash["strIngredient1"]
  ingredient = Ingredient.new(name: ingredient_hash["strIngredient1"])
  ingredient.save
end

url = "data:image/jpeg;base64,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"
cocktail = Cocktail.new(name: 'Sidecar')
cocktail.save!
cocktail.photo_url = url # Upload happens here
