get "/decks/:id/preview" do

  erb :'decks/preview'
end

post "/decks/:id/play/:card_id" do
  @current_round = Round.create(user_id: session[:id], deck_id: params[:id])
  @deck = Deck.find_by(id: params[:id])
  @card = @deck.cards.find_by(id: params[:card_id])

  erb :'decks/play'
end

get '/decks/:id/play/:card_id' do
  @current_round = Round.find(params[:round_id].to_i)
  @deck = Deck.find_by(id: params[:id])
  @guess = Guess.create(card_id: params[:card_id], round_id: @current_round.id)
  @card = Card.find_by(id: params[:card_id])
  @correct_cards = @current_round.played_cards.count - @current_round.incorrectly_guessed_cards.count
  if params[:answer] == @card.answer
     @guess.correct = 1
     if @guess.first_try?
      @current_round.first_tries += 1
      @current_round.save
     end
   end
  #BREAKING BECAUSE IT KEEPS ON INCREMENTING IN THE FIRST IF LOOP
  if params[:card_id].to_i <= current_deck.cards.count
    redirect "/decks/#{params[:id]}/play/#{params[:card_id].to_i + 1}?round_id=#{@current_round.id}"
    # erb :'decks/play'
  elsif @correct_cards >= current_deck.cards.length
    redirect "/decks/#{current_deck.id}/complete/#{@current_round.id}"
  else
    redirect "/decks/#{current_deck.id}/play/1?round_id=#{@current_round.id}"
  end
  # redirect "/decks/#{params[:id]}/cards/#{params[:card_id].to_i + 1}?round_id=#{@current_round.id}"
end

get '/decks/:id/complete/:round_id' do
  @current_round = Round.find(params[:round_id])
  erb :'decks/completed'
end
