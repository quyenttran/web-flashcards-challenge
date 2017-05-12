class Deck < ActiveRecord::Base
  validates :name, presence: true

  has_many :rounds
  has_many :cards
end
