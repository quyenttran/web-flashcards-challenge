class Round < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :played_cards, through: :guesses, source: :card
  has_many :incorrect_guesses, ->{ where(correct: 1) }, class_name: :Guess
  has_many :incorrectly_guessed_cards, through: :incorrect_guesses, source: :card
end
