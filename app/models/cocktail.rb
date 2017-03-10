class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_attachment :photo
  # validates :photo, presence: true
  validates :name, presence: true, uniqueness: true
end
