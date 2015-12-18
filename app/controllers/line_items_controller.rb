class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create]
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    if @line_item.save
      flash[:success] = "#{@line_item.product.title} added to cart"
      redirect_to @line_item.cart
    else
      redirect_to(:back)
    end
  end

  def update
    @cart = Cart.find(session[:cart_id])
    @line_item.quantity = params[:quantity]
    @line_item.save
    redirect_to cart_path(@cart)
  end

  def destroy
    @cart = @line_item.cart
    @line_item.destroy
    redirect_to cart_path(@cart)
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:product_id)
  end
end
