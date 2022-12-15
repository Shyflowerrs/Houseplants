class CategoryController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    #  @product = Category.find(@plants["category_id"])
  end
end
