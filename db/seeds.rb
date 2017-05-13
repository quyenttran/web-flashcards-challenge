require 'faker'
require 'csv'

deck = Deck.create(name: 'nighthawk')
deck2 = Deck.create(name: 'otter')
deck3 = Deck.create(name: 'raccoon')

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
inventors_deck = Deck.create(name: 'inventors')
inventors_keys = [:question, :answer]
inventors_qs = []
inventors_as = []
CSV.foreach('inventors.csv', headers: true) do |row|
  inventors_qs << row[1]
  inventors_as << row[0]
end
q_a = inventors_qs.zip(inventors_as)
inventors_cards = []
q_a.each do |pair|
  inventors_cards << Hash[inventors_keys.zip(pair)]
end
inventors_cards.each do |card|
  card[:deck_id] = inventors_deck.id
  Card.create(card)
end

# Create inventors flashcard deck
usa_historical_capitals_deck = Deck.create(name: 'usa_historical_capitals')
usa_historical_capitals_keys = [:question, :answer]
usa_historical_capitals_qs = []
usa_historical_capitals_as = []
CSV.foreach('usa_historical_capitals.csv', headers: true) do |row|
  usa_historical_capitals_qs << row[1]
  usa_historical_capitals_as << row[0]
end
q_a = usa_historical_capitals_qs.zip(usa_historical_capitals_as)
usa_historical_capitals_cards = []
q_a.each do |pair|
  usa_historical_capitals_cards << Hash[usa_historical_capitals_keys.zip(pair)]
end
usa_historical_capitals_cards.each do |card|
  card[:deck_id] = usa_historical_capitals_deck.id
  Card.create(card)
end

# Create the first user
User.create(username: "first_user", password: "password")
