get '/decks/:id/preview' do
  session[:deck] = params[:id]
  Round.create(user_id: session[:id], deck_id: params[:id], total_guesses: 0)
  session[:round] = Round.last.id
  erb :'decks/preview'
end

get '/decks/:id/play/:card_id' do
  @card = Card.find(params[:card_id])
  session[:card] = params[:card_id]
  erb :'decks/play'
end

post '/decks/:id/play/:card_id' do
  new_guess_total = Round.find(session[:round]).total_guesses += 1
  Round.find(session[:round]).update_attribute(:total_guesses, new_guess_total)
  if params[:answer] == Card.find(params[:card_id]).answer
    guess = Guess.create(card_id: params[:card_id], round_id: session[:round], correct: 1)
    if guess.first_try?
      new_first_try_total = Round.find(session[:round]).first_tries + 1
      Round.find(session[:round]).update_attribute(:first_tries, new_first_try_total)
    end

  else
    Guess.create(card_id: params[:card_id], round_id: session[:round])
  end
  redirect '/decks/results' if Round.find(session[:round]).cards_left.length == 0
  card = Round.find(session[:round]).cards_left.sample.id
  redirect "/decks/#{session[:deck]}/play/#{card}"
end

get '/decks/results' do
  @round = Round.find(session[:round])
  erb :'decks/results'
end

get '/decks/new' do
  erb :'decks/new'
end

post '/decks' do
  deck = Deck.create(name: params[:name])
  redirect "/decks/new/#{deck.id}"
end

get "/decks/new/:id" do
  @deck = Deck.find(params[:id])
  erb :'cards/new'
end


post "/decks/new/:id" do
  @deck = Deck.find(params[:id])
  Card.create(question: params[:question],answer: params[:answer],deck_id: params[:id])
  erb :'cards/new'

end
