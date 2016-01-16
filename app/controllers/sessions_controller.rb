class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    p params
    if (@user && @user.authenticate(params['session']['password']))
      session[:user_id] = @user.id
      unless @user.admin
        redirect_to root_path
      else
        @resume = Product.find_by(title: "resume")
        @cover_letter = Product.find_by(title: "cover letter")
        @cv = Product.find_by(title: "CV")
        p @resume
        p "************************************"
        redirect_to charlie_path
      end
    else
      render 'sessions/new'
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
