class ProductsController < ApplicationController
  def edit
    @resume = Product.find_by(title: "resume")
    @cover_letter = Product.find_by(title: "cover letter")
    @cv = Product.find_by(title: "CV")
  end

  def update
    p params
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to charlie_path
  end

  private

  def product_params
    params.require(:product).permit(:price)
  end
end
