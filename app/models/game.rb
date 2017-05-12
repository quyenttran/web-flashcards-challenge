class Game < ApplicationRecord
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :rounds


  def total_guesses
    total = 0
    self.rounds.each do |round|
    round.guesses.each do |guess|
      total = count
    end
   end
   total
  end

end
