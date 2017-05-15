class Guess < ApplicationRecord
  belongs_to :round
  belongs_to :card

  def first_try?
    self.round.played_cards.where(id: card).count == 1
  end

  def cards_left

  end
end
