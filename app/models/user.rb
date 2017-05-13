require 'bcrypt'

class User < ApplicationRecord
  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :decks_played, through: :rounds, source: :deck

  validates :username, :hashed_password, presence: true
  validates :username, uniqueness: true
  validate :password_is_not_blank

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

  private

  def password_blank?
    password == ''
  end

  def password_is_not_blank
    if password_blank?
      errors.add(:password, "can't be blank")
    end
  end
end
