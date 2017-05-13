class User < ApplicationRecord
  validates :name, :email, :hashword, { presence: true }
  validates :email, uniqueness: true, format: { with: /\w+@\w+\.\w+/  }

  has_many :rounds

  def authenticate(password)
    return false if self == nil
    self.password == password
  end

  def password
    @password ||= BCrypt::Password.new(hashword)
  end

  def password=(password)
    @password = BCrypt::Password.create(password)
    self.hashword = @password
  end
end
