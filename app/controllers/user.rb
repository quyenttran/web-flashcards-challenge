
get "/users/new" do
  @user = User.new
  erb :'users/new'
end

post "/users" do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect '/'
  else
    @errors = ["You cant leave fields blank!"]
    erb :'users/new'
  end
end

get '/users/logout' do
  session.delete(:id)
  erb :'index'

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    session[:id] = @user.id
    redirect :"/users/#{@user.id}/profile"
  else
    @errors = "Username and password did not match"
    erb :'users/login'
  end
end

get '/users/:id/profile' do
  @user = User.find(params[:id])
  erb :'users/profile'
end
