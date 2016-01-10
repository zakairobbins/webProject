class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private

  def auth_current_user(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def require_admin
    unless session[:user_id] && User.find(session[:user_id]).admin
      flash[:error] = "You must sign in before continuing"
      redirect_to login_url
    end
  end


end
