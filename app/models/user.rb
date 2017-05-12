class User < ApplicationRecord
  # Remember to create a migration!
  has_many :games
  validates :username, :hashed_password, {presence: true}
end
