class Guess < ApplicationRecord
  # Remember to create a migration!
  belongs_to :round
  belongs_to :card
  validates :guess, {presence: true}

  def correct?(guess, answer)
    return true if guess == answer
    false
  end
end
