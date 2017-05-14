get '/' do
  # session.clear
  @decks = Deck.all
  erb :index
end
