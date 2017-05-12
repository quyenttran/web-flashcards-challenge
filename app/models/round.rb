class Round < ApplicationRecord
  # Remember to create a migration!
  belongs_to :game
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

end
