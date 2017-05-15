require 'bcrypt'

class User < ApplicationRecord
  # Remember to create a migration!
  include BCrypt
  has_many :rounds
  validates :username, :hashed_password, { presence: true }
  validates :username, { uniqueness: true, length: { minimum: 5 } }
  validate :password_presence

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

  private
  def password_presence
    errors.add(:password, 'cannot be blank') if password_blank?
  end

  def password_blank?
    self.password == ''
  end
end
