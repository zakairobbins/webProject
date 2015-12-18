module CartsHelper
  def total_cart_price(cart)
    result = 0
    cart.line_items.each do |item|
      result += (item.product.price * item.quantity)
    end
    number_to_currency(result)
  end
end
