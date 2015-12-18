class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  def show
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
    flash[:success] = "Shopping cart empty"
    redirect_to root_url
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def invalid_cart
      flash[:notice] = "Invalid cart"
      redirect_to root_path
    end

    def cart_params
      params[:cart]
    end
end
