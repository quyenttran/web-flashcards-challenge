class Card < ApplicationRecord
  # Remember to create a migration!
  belongs_to :deck
  validates :answer, :question, {presence: true}

  def display_question
    "#{self.question}"
  end
end
