class Deck < ApplicationRecord
  has_many :rounds
  has_many :cards
  has_many :guesses, through: :cards
end
