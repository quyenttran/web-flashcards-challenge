class Round < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :played_cards, through: :guesses, source: :card
  has_many :correct_guesses, ->{ where(correct: 1) }, class_name: :Guess
  has_many :incorrect_guesses, ->{ where(correct: 0) }, class_name: :Guess
  has_many :incorrectly_guessed_cards, through: :incorrect_guesses, source: :card

  def cards_left
    arr = self.correct_guesses.map { |guess| guess.card.id }
    self.deck.cards - self.deck.cards.find(arr)
  end
end
