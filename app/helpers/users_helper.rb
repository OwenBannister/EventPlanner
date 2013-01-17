module UsersHelper

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

def signin_as(user)
    session[:user_id] = user.id
    @current_user = user
  end

    def signout
    @current_user = nil
    session.delete(:user_id) if session
  end

    # return true when the user is signed in
  def signed_in?
    !current_user().nil?
  end
end
