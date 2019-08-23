class ProductsController < ApplicationController
    skip_before_action :authenticate_user!, only: :index

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
   redirect_to root_path if Product.new(product_params).save
  end


  private

  def product_params
    params.require(:product).permit(:name, :tagline)
  end

end
