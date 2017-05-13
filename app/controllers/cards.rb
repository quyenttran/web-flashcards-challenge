get '/cards' do
	@cards = Card.all.order(:id)
	erb :'cards/index'
end

get '/cards/:id' do
	@card = Card.find(params[:id])
	erb :'cards/show'
end
