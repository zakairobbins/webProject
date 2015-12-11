class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    p params
    if (@user && @user.authenticate(params['session']['password']))
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'sessions/new'
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
