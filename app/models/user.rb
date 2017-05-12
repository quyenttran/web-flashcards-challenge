class User < ApplicationRecord
  has_many :rounds
  has_many :guesses, through: :rounds


end
