class Round < ApplicationRecord
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :guesses

end
