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
end
