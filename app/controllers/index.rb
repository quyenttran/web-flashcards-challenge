get '/' do
  @decks = Deck.all
  erb :index
end

get '/games/show' do
  #need to replace deck_id and user_id with dynamic values
  @game = Game.create(deck_id: 1, user_id: 1)
  session['game_id'] = @game.id
  @round = Round.create(game_id: session['game_id'])
  session['round_id'] = @round.id
  session['deck_id'] = @game.deck_id
  session['card_id'] = @game.deck.cards.shuffle.first.id
  session['deck'] = @game.get_deck
  session['next_round_deck'] = []
  erb :'/games/show'
end

get '/cards/:id' do
  puts "#{session['next_round_deck']}"
  @guess = Guess.create(round_id: session['round_id'], card_id: session['card_id'], guess: params[:guess])
  @correct_answer = Card.find(session['card_id']).answer
  if @guess.correct?(params[:guess], @correct_answer)
    session['next_round_deck'] << session['deck'].destroy(session['deck'].find(session['card_id']))
    erb :'/cards/success'
  else
    erb :'/cards/fail'
  end
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


