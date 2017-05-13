class Round < ApplicationRecord
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  # def correct_guesses
  #   count = 0
  #   (self.game.deck.cards.count).times do
  #     self.guesses.each do |guess|
  #       if guess.card.id ==  self.deck.card.id
  #       guess.downcase == self.game.deck.card.answer.downcase ? count+=1 : count+=0
  #       end
  #     end
  #   end
  #   count
  # end

  def total_guesses
    total = 0
    self.rounds.each do |round|
    round.guesses.each do |guess|
      total = count
    end
   end
   total
  end

  def get_deck
    self.deck.cards.dup.to_a
  end

  def end_of_round?(correct_deck, wrong_deck, deck)
    return true if correct_deck.length + wrong_deck.length == deck.length
    false
  end
end
