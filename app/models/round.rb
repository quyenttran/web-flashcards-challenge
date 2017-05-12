class Round < ApplicationRecord
  # Remember to create a migration!
  belongs_to :game
  has_many :guesses
end
