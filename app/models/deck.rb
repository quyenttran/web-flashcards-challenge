class Deck < ActiveRecord::Base
  validates :name, presence: true

  has_one :rounds
  has_many :cards
end
