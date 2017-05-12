require 'faker'

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

nighthawk.each do |card|
  Card.create(card)
end

qyen = {username: 'qyen', hashed_password: 'abcdefg'}

User.create(qyen)
