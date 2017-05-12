class Guess < ApplicationRecord
  # Remember to create a migration!
  belongs_to :round
  belongs_to :card
  validates :guess, {presence: true}
end
