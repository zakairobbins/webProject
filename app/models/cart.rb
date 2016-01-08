class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)

    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end

    current_item
  end

  def total_price
    result = 0
    line_items.each do |item|
      result += (item.product.price * item.quantity)
    end

    result.to_f
  end

  def generate_short_list
    result = ''
    line_items.each do |item|
      if result.empty?
        result += item.product.title
      else
        result += ', ' + item.product.title
      end
    end

    result 
  end
end
