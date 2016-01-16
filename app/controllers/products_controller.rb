class ProductsController < ApplicationController
  before_action :require_admin

  def edit
    @resume = Product.find_by(title: 'resume')
    @coverletter = Product.find_by(title: 'cover letter')
    @cv = Product.find_by(title: 'CV')
  end

  def update
    product = Product.find(params[:id])
    if product.update_attributes(product_params)
      flash[:success] = "#{product.title}'s price updated to #{product.price}"
      redirect_to charlie_url
    else
      flash[:alert] = "Product not updated"
      redirect_to charlie_url
    end
  end

  private
    def product_params
      params.require(:product).permit(:price)
    end
end
