enable :sessions

get '/login' do
  erb :'users/login'
end

post '/login' do
  if @user = User.find_by(name: params[:user][:name])
    @user.authenticate(params[:user][:password])
    session[:id] = @user.id
    session[:name] ||= @user.name
    redirect "/users/#{@user.id}"
  else
    erb :'users/login'
  end
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  @user.password=(params[:user][:password])
  if @user.save
    session[:id] = @user.id
    session[:name] ||= @user.name
    redirect "/users/#{@user.id}"
  else
    erb :'users/new_error'
  end
end

get '/users/:id' do
  erb :'users/login' unless session[:id]
  @user = User.find(params[:id])
  @card = Card.find(params[:id])
  @cards = Card.where(deck_id: @card.deck_id).count
  puts @card.deck_id
  puts params
  puts @cards
  @rounds = Round.where(user_id: params[:id])
  erb :'users/profile'
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/login'
end

put '/users/:id' do
  @user = User.find(params[:id])
  @user.update_attributes(params[:user])
  @user.password=(params[:user][:password])
  @user.save
  redirect "/users/#{@user.id}"
end

get '/users/:id/entry' do
  @user = User.find(params[:id])
  erb :'users/login'
end

get '/logout' do
  session.clear
  redirect '/'
end



# get '/users/new' do
#   @user = User.new
#   erb :'users/new'
# end

# post '/users' do
#   @user = User.create(params[:user])
#   if @user.valid?
#     redirect '/login'
#   else
#     @errors = @user.errors.full_messages
#     status 422
#     erb :'users/new'
#   end
# end
