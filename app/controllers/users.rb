get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.create(params[:user])
  if @user.valid?
    redirect '/login'
  else
    @errors = @user.errors.full_messages
    status 422
    erb :'users/new'
  end
end
