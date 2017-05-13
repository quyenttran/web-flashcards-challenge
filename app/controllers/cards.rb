get '/round/:round_id/card/:card_id' do 
	puts params
	@deck = Deck.find(params[:id])
	@card = Card.find(params[:id])
	erb :'cards/show'
end


post '/round/:round_id/card/:card_id' do
	@round = Round.find_by(params[:id])
	#find or create guess
	@guess = Guess.create(user_id: session[:id], card_id: params[:id])
	if @guess == card.answer
		redirect 'round/:round_id/card/:card_id'
	else
		erb :'cards/show'
	end
	#when correct, redirect to guess.card.id +1
	#when incorrect rerender with errors
end
