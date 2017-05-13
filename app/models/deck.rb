class Deck < ApplicationRecord
  # Remember to create a migration!
  has_many :cards
  has_many :rounds
  validates :name, {presence: true}
end
