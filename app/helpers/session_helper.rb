module HelpersForUser

  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  def logged_in?
    current_user ? true : false
  end

  def render_403
    puts "did it work"
    status 403
    @errors = ['Invalid Credentials']
    erb :'404'
  end

  def render_422(object)
    status 422
    @errors = object.errors.full_messages
    erb :'404'
  end

  def saved(object)
    object.valid? ? object.save : false
  end

end


helpers HelpersForUser
