require 'faker'
require 'csv'

deck = Deck.create(name: 'nighthawk')

nighthawk = [{ question: "What is a nighthawk's primary food source?",
answer: "insects", deck_id: deck.id},
{question: "True or false?  Nighthawks are closely related to hawks.",
  answer: "false", deck_id: deck.id},
{question: "True or false?  Nighthawks make nests.", answer: "false", deck_id: deck.id},
{question: "Where do Common Nighthawks spend the winter?
", answer: "South America", deck_id: deck.id},
{question: "True or false?  Bullbat is another name for the Common Nighthawk.
", answer: "true", deck_id: deck.id
}]

q_keys = []
questions = []
answers = []
CSV.foreach('inventors.csv', headers: true) do |row|
  questions << row[1]
  answers << row[0]

end


nighthawk.each do |card|
  Card.create(card)
end
