def logged_in?
  !!session[:id]
end

def current_user
  User.find_by(id: session[:user_id])
end
