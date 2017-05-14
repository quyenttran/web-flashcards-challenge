require 'faker'
require 'csv'


# Create nighthawks flashcard deck
nighthawks_deck = Deck.create(name: 'Nighthawks')
nighthawk = [{ question: "What is a nighthawk's primary food source?",
answer: "insects", deck_id: nighthawks_deck.id},
{question: "True or false?  Nighthawks are closely related to hawks.",
  answer: "false", deck_id: nighthawks_deck.id},
{question: "True or false?  Nighthawks make nests.", answer: "false", deck_id: nighthawks_deck.id},
{question: "Where do Common Nighthawks spend the winter?
", answer: "South America", deck_id: nighthawks_deck.id},
{question: "True or false?  Bullbat is another name for the Common Nighthawk.
", answer: "true", deck_id: nighthawks_deck.id
}]
nighthawk.each do |card|
  Card.create(card)
end

# Create inventors flashcard deck
inventors_deck = Deck.create(name: 'Inventors')
CSV.foreach('inventors.csv', headers: true) do |row|
  qa_keys = [:question, :answer]
  qa_hash = Hash[qa_keys.zip([row[1], row[0]])]
  qa_hash[:deck_id] = inventors_deck.id
  Card.create(qa_hash)
end

# Create USA Historical Capitals flashcard deck
usa_historical_capitals_deck = Deck.create(name: 'USA Historical Capitals')
CSV.foreach('usa_historical_capitals.csv', headers: true) do |row|
  qa_keys = [:question, :answer]
  qa_hash = Hash[qa_keys.zip([row[1], row[0]])]
  qa_hash[:deck_id] = usa_historical_capitals_deck.id
  Card.create(qa_hash)
end

# Create the first user
User.create(username: "first_user", password: "password")

