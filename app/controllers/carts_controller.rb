class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  def show
    @request = Order.find(session[:order_id]).request if session[:order_id]
  end

  def index
    @carts = Cart.all
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def update
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    session[:order_id] = nil
    flash[:success] = "Shopping cart empty"
    redirect_to root_url
  end

  def checkout
    @cart = Cart.find(session[:cart_id])
    @request = Order.find(session[:order_id]).request
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def invalid_cart
      flash[:alert] = "Invalid cart"
      redirect_to root_path
    end

    def cart_params
      params[:cart]
    end
end
