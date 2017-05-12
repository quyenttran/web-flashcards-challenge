def all_decks
  @deck ||= Deck.all
end

def current_deck
  @deck ||= Deck.find_by(id: params[:id])
end

def current_card
  @card ||= current_deck.card.find_by(id: params[:card_name])
end
