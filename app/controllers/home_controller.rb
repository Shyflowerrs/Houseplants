class HomeController < ApplicationController
  def index
    @plants = Product.order("name DESC")
    @category = Category.all

    @data = @plants.page(params[:page])
    # @pagination = @dogs.page(7)
  end

  def show
    @plantshow = Product.find(params[:id])
  end
end
