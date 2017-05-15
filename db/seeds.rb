require 'faker'
require 'csv'

deck = Deck.create(name: 'nighthawk')
deck2 = Deck.create(name: 'otter')
deck3 = Deck.create(name: 'raccoon')

# Create nighthawks flashcard deck

nighthawk = [{ question: "What is a nighthawk's primary food source?",
answer: "insects", deck_id: deck1.id},
{question: "True or false?  Nighthawks are closely related to hawks.",
  answer: "false", deck_id: deck1.id},
{question: "True or false?  Nighthawks make nests.", answer: "false", deck_id: deck1.id},
{question: "Where do Common Nighthawks spend the winter?
", answer: "South America", deck_id: deck1.id},
{question: "True or false?  Bullbat is another name for the Common Nighthawk.
", answer: "true", deck_id: deck1.id
}]

nighthawk.each do |card|
  Card.create(card)
end

otter = [{ question: "What is an otter's primary food source?", answer: "fish", deck_id: deck2.id},
  {question: "True or false? Otters spend the majority of their time on land.", answer: "true", deck_id: deck2.id},
  {question: "How many species of otters are there?", answer: "13", deck_id: deck2.id},
  {question: "True of false? Otters are native to Australia.", answer: "false", deck_id: deck2.id},
  {question: "True or false? Otters make and use tools.", answer: "true", deck_id: deck2.id},
  {question: "In years, what is the average life span of an otter in the wild?", answer: "10", deck_id: deck2.id}]

otter.each do |card|
  Card.create(card)
end

raccoon = [{ question: "What is a male raccoon called?", answer: "boar", deck_id: deck3.id},
  {question: "What is a female raccoon called?", answer: "sow", deck_id: deck3.id},
  {question: "Are raccoons herbivorous, carnivorous, or omnivorous?", answer: "omnivorous", deck_id: deck3.id},
  {question: "True or false?  Raccoons are nocturnal.", answer: "true", deck_id: deck3.id},
  {question: "True or false?  Raccoons hibernate.", answer: "false", deck_id: deck3.id},
  {question: "True or false?  Raccoons can run at speeds up to 15 miles per hour.", answer: "true", deck_id: deck3.id}]

raccoon.each do |card|
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

