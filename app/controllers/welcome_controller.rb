class WelcomeController < ApplicationController
  include CurrentCart
  before_action :require_admin, only: :admin

  def index
    set_cart
    p params
  end

  def admin

  end

end
