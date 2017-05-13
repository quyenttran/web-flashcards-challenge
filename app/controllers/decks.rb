get '/decks/:id' do
  @deck = Deck.find(params[:id])

  erb :"/decks/deck"
end

get '/decks/:id/play' do
  puts params
  @round = Round.create(deck_id: params[:id], user_id: session[:id])
  @deck = Deck.find(params[:id])
  @user = User.find(session[:id])

  erb :"decks/play"
end

get '/results' do
  @user = User.find(session[:id])
  erb :"decks/results"
end
