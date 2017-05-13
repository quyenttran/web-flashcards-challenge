class Round < ApplicationRecord
  has_many :guesses
  has_one :deck

  def score=(new_score)
    @score = new_score
  end
end
