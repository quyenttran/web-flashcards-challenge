users = [
  { name: Faker::LordOfTheRings.character,
    email: Faker::Internet.email,
    password: "password"
  },
  { name: Faker::Friends.character,
    email: Faker::Internet.email,
    password: "password"
  },
  { name: Faker::LordOfTheRings.character,
    email: Faker::Internet.email,
    password: "password"
  },
  { name: Faker::Pokemon.name,
    email: Faker::Internet.email,
    password: "password"
  }
]

decks = [
  {
    name: 'Chuck Norris Facts 1'
  },
  {
    name: 'Chuck Norris Facts 2'
  },
  {
    name: 'Chuck Norris Facts 3'
  }
]

cards = [
  {
    question: Faker::ChuckNorris.unique.fact,
    answer: true
  },
  {
    question: Faker::ChuckNorris.unique.fact,
    answer: true
  },
  {
    question: Faker::ChuckNorris.unique.fact,
    answer: true
  },
  {
    question: Faker::ChuckNorris.unique.fact,
    answer: true
  },
  {
    question: Faker::ChuckNorris.unique.fact,
    answer: true
  },
  {
    question: Faker::ChuckNorris.unique.fact,
    answer: true
  },
    {
    question: Faker::ChuckNorris.unique.fact,
    answer: true
  },
  {
    question: Faker::ChuckNorris.unique.fact,
    answer: true
  },
  {
    question: Faker::ChuckNorris.unique.fact,
    answer: true
  },
  {
    question: Faker::ChuckNorris.unique.fact,
    answer: true
  },
  {
    question: Faker::ChuckNorris.unique.fact,
    answer: true
  },
  {
    question: Faker::ChuckNorris.unique.fact,
    answer: true
  }
]



User.create!(users)
Deck.create!(decks)
Card.create!(cards)
Card.where(id:1..4).each{|card| card.update_attributes(deck_id:1)}
Card.where(id:5..8).each{|card| card.update_attributes(deck_id:2)}
Card.where(id:5..8).each{|card| card.update_attributes(deck_id:3)}
