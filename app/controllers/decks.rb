get '/decks/:id' do
  @deck = Deck.find(params[:id])
  session[:deck_id] = @deck.id
  @card = @deck.cards.order(:id).first
  @round = Round.create(deck_id: params[:id], user_id: session[:id])
  erb :"/decks/deck"
end

get '/decks/:id/cards/:id' do
  @card = Card.find(params[:id])
  @user = User.find(session[:id])
  @deck = Deck.find(session[:deck_id])
  @round = Round.find_by(deck_id: @deck.id)
  erb :'decks/play'
end

post '/decks/:id/cards/:id' do
  # puts params[:guess].class
  card = Card.find(params[:id])
  # puts card.answer.class
  user = User.find(session[:id])
  deck = Deck.find(session[:deck_id])
  round = Round.find_by(deck_id: deck.id)
  puts "round***********************"
  puts round.inspect
  guess = Guess.create(guess: params[:guess])
  if card.answer == guess
    round.increment
    redirect "/decks/#{deck.id}/cards/#{card.id + 1}"
  else
    redirect "/decks/#{deck.id}/cards/#{card.id + 1}"
  end
  erb :'decks/play'
end

get '/results' do
  @user = User.find(session[:id])
  @round = Round.find(session[:round_id])
  
  erb :"decks/results"
end

