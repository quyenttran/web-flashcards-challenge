get '/game/end' do
  # display change for user id authentication in layout?
  @game = Game.find_by(id: session['game_id'])
  # @game = Game.find_by(id: 1)
  @second_round = @game.rounds.second
  @first_round = @game.rounds.first
  erb :'game/results'
end

get '/game/start' do
  #need to replace deck_id and user_id with dynamic values
  @round = Round.create(deck_id: 1, user_id: 1)
  session['round_id'] = @round.id

  erb :'game/start'
end

get '/game/show' do
  @round = Round.find(session['round_id'])
  session['deck_id'] = @round.deck.id
  session['card_id'] = @round.deck.cards.shuffle.first.id
  session['current_deck'] = @round.get_deck
  session['correct_deck'] = []
  session['wrong_deck'] = []

  erb :'/game/show'
end

#not able to instantiate a guess anymore for some reason..
post '/cards/guess' do
  @guess = Guess.create(:guess)
  @correct_answer = Card.find(session['card_id']).answer
  if @guess.correct?(params[:guess], @correct_answer)
    redirect to '/cards/success'
  else
    redirect to '/cards/fail'
  end
end

