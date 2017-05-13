class Game < ApplicationRecord
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :rounds

  def get_deck
    self.deck.cards.dup.to_a
  end


end
