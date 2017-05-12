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
    name: Faker::Beer.name
  },
  {
    name: Faker::University.name
  },
  {
    name: Faker::Space.moon
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
  }
]



User.create!(users)
Deck.create!(decks)
Card.create!(cards)
