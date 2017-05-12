require 'bcrypt'

class User < ApplicationRecord
  has_many :rounds
  has_many :guesses, through: :rounds

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(given_password)
    password == given_password
  end
end
