
Deck.create(name: "raccoon")
Deck.create(name: "otter")

Card.create(
  question: "What is a nighthawk's primary food source?",
  answer: "insects",
  deck_id: 1,
)
Card.create(
  question: "True or false?  Nighthawks are closely related to hawks.",
  answer: "false",
  deck_id: 1,
)
Card.create(
  question: "True or false?  Nighthawks make nests.",
  answer: "false",
  deck_id: 1,
)
Card.create(
  question: "Where do Common Nighthawks spend the winter?",
  answer: "South America",
  deck_id: 1,
)
Card.create(
  question: "True or false?  Bullbat is another name for the Common Nighthawk.",
  answer: "true",
  deck_id: 1,
)

Card.create(
  question: "What is an otter's primary food source?",
  answer: "fish",
  deck_id: 2,
)
Card.create(
  question: "True or false? Otters spend the majority of their time on land.",
  answer: "true",
  deck_id: 2,
)
Card.create(
  question: "How many species of otters are there?",
  answer: "13",
  deck_id: 2,
)
Card.create(
  question: "True of false? Otters are native to Australia.",
  answer: "false",
  deck_id: 2,
)
Card.create(
  question: "True or false? Otters make and use tools.",
  answer: "true",
  deck_id: 2,
)
Card.create(
  question: "In years, what is the average life span of an otter in the wild?",
  answer: "10",
  deck_id: 2,
)

User.create(
  username: "aaa",
  password: "aaa"
  )

Round.create(
  user_id: 1,
  deck_id: 1,
  complete: 1,
  first_tries: 4,
  total_guesses: 10
  )

Round.create(
  user_id: 1,
  deck_id: 1,
  complete: 1,
  first_tries: 2,
  total_guesses: 4
  )

Round.create(
  user_id: 1,
  deck_id: 2,
  complete: 1,
  first_tries: 3,
  total_guesses: 20
  )

