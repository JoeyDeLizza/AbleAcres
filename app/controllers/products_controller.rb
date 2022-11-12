class ProductsController < ApplicationController
  def new
    @user = current_user
    if @user.admin == true
      @product = Product.new
    else
      redirect_to store_path
    end
  end

  def index
    @products = Product.all
  end
  
  def create
    @product = Product.create(product_params)
    if @product.valid?
      flash[:success] = "Successfully added new product"
      redirect_to new_product_path
    else
      flash[:error] = "Error- Something went wrong :/"
      redirect_to new_product_path
    end
  end

  def show
    @products = Product.all
  end

  private 
  def product_params
    params.require(:product).permit(:name, :desc, :price, :pic)
  end
end
