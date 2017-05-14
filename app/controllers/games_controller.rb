get '/game/end' do
  # display change for user id authentication in layout?
  @game = Game.find_by(id: session['game_id'])
  # @game = Game.find_by(id: 1)
  @second_round = @game.rounds.second
  @first_round = @game.rounds.first
  erb :'game/results'
end

get '/game/start/:id' do
  #need to replace user_id with dynamic value
  @round = Round.create(deck_id: params[:id], user_id: 1)
  session[:round_id] = @round.id
  session[:current_deck] = @round.get_deck_questions.shuffle
  session[:deck_length] = session[:current_deck].length

  erb :'game/start'
end

get '/game/show' do
  if session[:current_deck].empty?
    # if no more questions in current deck, directs user to status page
    erb :'/game/end'
  else
    @round = Round.find(session[:round_id])
    session[:question] = session[:current_deck].first
    session[:deck_id] = @round.deck.id
    @card = Card.find_card_by_question(session[:question])
    session[:card_id] = @card.id

    erb :'/game/show'
  end
end

post '/cards/:id/guesses' do
  @round = Round.find(session[:round_id])
  @guess = Guess.create(round_id: session[:round_id], card_id: params[:id], guess: params[:guess])
  @card = Card.find(params[:id])
  if @guess.correct?(params[:guess], @card.answer)
    @round.increment!(:all_rounds_guesses, by = 1)
    @round.increment!(:first_round_corrects, by = 1) unless @round.all_rounds_guesses >= session[:deck_length]
    session[:current_deck].delete(session[:question])
    redirect to :"/cards/#{params[:id]}/success"
  else
    @round.increment!(:all_rounds_guesses, by = 1)
    session[:current_deck] << session[:current_deck].delete(session[:question])
    redirect to :"/cards/#{params[:id]}/fail"
  end
end

get '/cards/:id/success' do
  @card = Card.find(params[:id])
  erb :'/cards/success'
end

get '/cards/:id/fail' do
  @card = Card.find(params[:id])
  erb :'/cards/fail'
end

