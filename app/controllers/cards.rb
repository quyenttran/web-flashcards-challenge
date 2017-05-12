get '/user/:id/round/:id/card/:id' do 
	@card = Card.find_by(params[:id])
	erb :'card/show'
end


# get '/card/:id' do
# 	@card = Card.find_by(deck_id: params[:id])
# 	puts @card 
# 	erb :'cards/show'
# end

post '/round/:round_id/card/:id' do 

end