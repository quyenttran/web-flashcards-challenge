class Round < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :played_cards, through: :guesses, source: :card

end
