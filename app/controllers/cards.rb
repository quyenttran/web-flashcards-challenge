get '/round/:id/card/:id' do 
	@deck = Deck.find(params[:id])
	@card = Card.find(params[:id])
	erb :'cards/show'
end


post '/round/:round_id/card/:id' do 
	@round = Round.find_by(params[:id])
	#find or create guess
	@guess = Guess.create(user_id: session[:id], card_id: params[:id])
	#when correct, redirect to guess.card.id +1
	#when incorrect rerender with errors
end