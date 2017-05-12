get "/decks/:id/card/:card_name" do
  @current_round = Round.new(user_id: session[:id], deck_id: params[:id])
  @deck = Deck.find_by(id: params[:id])
  @card = @deck.current_card
  erb :'play'
end

post '/decks/:id/card/:card_name' do


end
