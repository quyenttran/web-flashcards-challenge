# Index - display registration form
get '/users' do
  erb :'/users/index'
end

# New - display form to create new user
# Not necessary (on index)

# Create - create new user
post '/users/new' do
  # Create new user with post data
  user = User.create(params['user'])
  # Log in user
  session['user_id'] = user.id
  redirect to "/users/#{user.id}"
end

# Misc: Login(new) - display login form
get '/users/login' do
  erb :'/users/login'
end

# Misc: Login(create) -
post '/users/login' do
  # Authenticate login
  if User.authenticate(params['username'], params['password'])
    # Log in user
    user = User.find_by(username: params['username'])
    session['user_id'] = user.id
    redirect to '/'
  else
    # Bounce back to login
    redirect to '/users/login'
  end
end

# Edit
# Unnecessary

# Update
# Unnecessary

# Show - display user profile
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end

# Destroy - logout user
delete '/users/:id' do
  # Log out user
  session.delete('user_id')
  redirect to '/users'
end
