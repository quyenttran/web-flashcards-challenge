# get '/games/show' do
#   #need to replace deck_id and user_id with dynamic values
#   @round = Round.create(deck_id: 1, user_id: 1)
#   session['round_id'] = @round.id
#   session['deck_id'] = @round.deck_id
#   session['card_id'] = @round.deck.cards.shuffle.first.id
#   session['correct_deck'] = []
#   session['wrong_deck'] = []

#   if @round.end_of_round?(session['correct_deck'], session['wrong_deck'], @round.get_deck)
#     @round.count += 1
#     @round[:first_round_corrects] = session['correct_deck'].length
#   else
#     if session['wrong_deck'].empty?
#       session['current_deck'] = @round.get_deck
#     elsif
#       session['current_deck'] = session['wrong_deck']
#       if session['current_deck'].empty?
#         erb :'/games/finish'
#       end
#     end
#   end
#   erb :'/games/show'
# end

# get '/cards/:id' do
#   @guess = Guess.create(round_id: session['round_id'], card_id: session['card_id'], guess: params[:guess])
#   @correct_answer = Card.find(session['card_id']).answer
#   # card = Card.find(session['card_id'])
#   if @guess.correct?(params[:guess], @correct_answer)
#     # session['correct_deck'] << session['current_deck'].delete(card)
#     erb :'/cards/success'
#   else
#     # session['wrong_deck'] << session['current_deck'].delete(card)
#     erb :'/cards/fail'
#   end
# end

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
