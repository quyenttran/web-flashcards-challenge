class Round < ApplicationRecord
  has_many :guesses
  has_one :deck

  def increment
    self.score += 1
  end
end
