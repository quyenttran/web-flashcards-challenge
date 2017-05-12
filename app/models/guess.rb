class Guess < ApplicationRecord
  belongs_to :round
  belongs_to :card

  def first_try?
    self.round.played_cards.where(card: card).count == 1
  end
end
