get '/round/end' do
  # display change for user id authentication in layout?
  @round = Round.find_by(id: session['round_id'])
  erb :'round/results'
end

