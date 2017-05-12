require 'bcrypt'

class User < ApplicationRecord
  # Remember to create a migration!
  include BCrypt
  has_many :games
  validates :username, :hashed_password, {presence: true}
  validates :username, { uniqueness: true }
  validate :check_password_length

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(username, password)
    @user = User.find_by(username: username)
    @user.password == password ? true : false
  end

  def check_password_length
    if password.length <= 5
      errors.add(:password, 'must be at least 6 characters long!')
    end
  end
end
