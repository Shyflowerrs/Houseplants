class ProductController < ApplicationController
  def index; end

  def new
    @product = Product.new
  end

  def create
    Product.new(permit_params)
    # if  @product.save
    #   redirect_to  products_path, notice: "Quote was successfully created."
    # else
    #   render :new
    # end
  end

  def edit; end
end
