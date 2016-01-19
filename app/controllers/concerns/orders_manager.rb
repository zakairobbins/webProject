module OrdersManager
  extend ActiveSupport::Concern

  private
  def clear_completed_orders(cart)
    # p session
    # order = Order.find(session[:order_id])
    # rescue ActiveRecord::RecordNotFound
    #   session.destroy
    #   cart.order = nil
    #   session[:cart_id] = Cart.create.id
    if cart.order && cart.order.completed
      session.destroy
      session[:cart_id] = Cart.create.id
    end
  end
end
