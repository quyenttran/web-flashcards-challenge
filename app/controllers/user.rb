get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user.authenticate(params[:user][:passsword])
    redirect :"/users/#{@user.id}/profile"
  else
    erb :'user/login'
  end
end

get '/users/:id/profile' do
  @user = User.find(params[:id])
  erb :'users/profile'
end
