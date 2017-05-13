get '/round/:id/deck/:id/card/:id' do 
	puts params
	@card = Card.find(params[:id])
	@deck = Deck.find(params[:id])
	erb :'cards/show'
end


post '/round/:id/card/:id' do
	@round = Round.find_by(params[:id])
	#find or create guess
	@guess = Guess.create(user_id: session[:id], card_id: params[:id])
	if @guess == card.answer
		redirect 'round/:id/card/:id'
	else
		erb :'cards/show'
	end
	#when correct, redirect to guess.card.id +1
	#when incorrect rerender with errors
end
