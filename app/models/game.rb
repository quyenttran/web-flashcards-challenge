class Game < ApplicationRecord
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :rounds

  def get_deck
    duplicate_deck = self.deck.cards
  end


end
