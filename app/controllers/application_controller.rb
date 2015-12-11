class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  def auth_current_user(user)
    session[:user_id] = user.id
    @current_user = user
  end
end
