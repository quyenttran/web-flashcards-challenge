get '/decks/:id' do
  @deck = Deck.find(params[:id])

  erb :"/decks/deck"
end

get '/decks/:id/play' do
  puts params
  @round = Round.find_or_create_by(deck_id: params[:id], user_id: session[:id])
  @deck = Deck.find(params[:id])

  erb :"decks/play"
end
