get '/' do
  @decks = Deck.all
  erb :index
end

get '/games/show' do
  @game = Game.create(deck_id: 1, user_id: 1)
  @deck = Deck.find(@game.deck_id)
  erb :'/games/show'
end

# user clicks on a deck
# starts a game
  # Game.create(deck_id, user_id)
    #game id persists
# WHILE deck is not empty
  # display questions from deck
    # game id, deck id, card id persists
  # asks user to submit a guess
  # compares answers to card.answer
    # IF correct remove card from deck
    # ELSE
      # display correct answer
      # show next card
  # finished when deck is empty


