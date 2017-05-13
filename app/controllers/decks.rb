get '/decks/:id' do
  @deck = Deck.find(params[:id])
  session[:deck_id] = @deck.id
  @card = @deck.cards.order(:id).first
  @round = Round.create(deck_id: params[:id], user_id: session[:id])
  session[:round_id] = @round.id
  erb :"/decks/deck"
end

get '/decks/:id/cards/:id' do
  @card = Card.find(params[:id])
  @user = User.find(session[:id])
  @deck = Deck.find(session[:deck_id])
  @round = Round.find(session[:round_id])
  erb :'decks/play'
end

post '/decks/:id/cards/:id' do
  card = Card.find(params[:id])
  user = User.find(session[:id])
  deck = Deck.find(session[:deck_id])
  round = Round.find(session[:round_id])
  guess = Guess.create(guess: params[:guess])
  if card.answer == guess.guess
    round.increment!(:score, by=1)
    round.increment!(:guess, by=1)
    if Card.find(card.id+1).deck_id == deck.id
      redirect "/decks/#{deck.id}/cards/#{card.id + 1}"
    else
      redirect "/results"
    end
  else
    round.increment!(:guess, by=1)
    redirect "/decks/#{deck.id}/cards/#{card.id}"
  end
end

get '/results' do
  @user = User.find(session[:id])
  @round = Round.find(session[:round_id])
  erb :"decks/results"
end

