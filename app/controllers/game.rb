get '/game/end' do
  # display change for user id authentication in layout?
  @game = Game.find_by(id: sessions[:game_id])
  # @game = Game.find_by(id: 1)
  @second_round = @game.rounds.second
  @first_round = @game.rounds.first
  erb :'game/results'
end

