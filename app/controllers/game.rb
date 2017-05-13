get '/games/show' do
  #need to replace deck_id and user_id with dynamic values
  @round = Round.create(deck_id: 1, user_id: 1)
  session['deck_id'] = @round.deck_id
  session['card_id'] = @round.deck.cards.shuffle.first.id
  session['current_deck'] = @round.get_deck
  session['correct_deck'] = []
  session['wrong_deck'] = []
  erb :'/games/show'
end

get '/cards/:id' do
  @guess = Guess.create(round_id: session['round_id'], card_id: session['card_id'], guess: params[:guess])
  @correct_answer = Card.find(session['card_id']).answer
  if @guess.correct?(params[:guess], @correct_answer)
    session['correct_cards'] << session['deck'].destroy(session['deck'].find(session['card_id']))
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
