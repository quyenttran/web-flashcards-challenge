class Card < ApplicationRecord
  # Remember to create a migration!
  belongs_to :deck
  validates :answer, :question, {presence: true}

  scope :find_card, -> (question) { where('question = ?', question) }

  def self.find_card_by_question(question)
    self.find_card(question).first
  end
end
