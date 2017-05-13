class Round < ApplicationRecord
  has_many :guesses
  has_one :deck
end
