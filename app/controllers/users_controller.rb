# Index - display registration form
get '/users' do
  erb :'/users/index'
end

# Create - create new user
post '/users/new' do
  # Create new user with post data
  user = User.create(params['user'])
  # Log in user
  if user.valid?
    session['user_id'] = user.id
    redirect to "/users/#{user.id}"
  else
    @un_messages = user.errors[:username]
    @pw_messages = user.errors[:password]
    erb :'/users/index'
  end
end

# Misc: Login(new) - display login form
get '/users/login' do
  erb :'/users/login'
end

# Misc: Login(create) -
post '/users/login' do
  # Ensure username exists.
  @un_messages = []
  @pw_messages = []
  user = User.find_by(username: params['username'])
  # Give an error if username or password are blank
  if params['username'] == ''
    @un_messages << 'cannot be blank'
    erb :'/users/login'
  elsif params['password'] == ''
    @pw_messages << 'cannot be blank'
    erb :'/users/login'
  # Give an error if username doesn't exist in database
  elsif !user
    @un_messages << 'does not exist'
    erb :'/users/login'
  else
  # Else, authenticate login, and give session['user_id'] if authenticated
    if User.authenticate(params['username'], params['password'])
      # Log in user
      session['user_id'] = user.id
      redirect to '/'
    else
      # Give error if password is incorrect
      @pw_messages << 'is incorrect'
      erb :'/users/login'
    end
  end
end

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
