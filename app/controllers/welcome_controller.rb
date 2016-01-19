class WelcomeController < ApplicationController
  include CurrentCart
  include OrdersManager
  before_action :require_admin, only: :admin

  def index
    set_cart
    clear_completed_orders(@cart)
    p params
  end

  def admin

  end

  private

  # def clear_completed_orders(cart)
  #   p session
  #   if cart.order && cart.order.completed
  #     rescue ActiveRecord::RecordNotFound
  #     session.destroy
  #     session[:cart_id] = Cart.create.id
  #   end
  # end

end
