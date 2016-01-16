class WelcomeController < ApplicationController
  include CurrentCart
  before_action :require_admin, only: :admin

  def index
    set_cart
    clear_completed_orders(@cart)
    p params
  end

  def admin

  end

  private

  def clear_completed_orders(cart)
    if cart.order && cart.order.completed
      session.destroy
      session[:cart_id] = Cart.create.id
    end
  end

end
