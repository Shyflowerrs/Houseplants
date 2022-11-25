class ProductsController < InheritedResources::Base
  def index
    @plants = Product.all.order("name DESC")
  end

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

  def show
    @plants = Product.find(params[:id])
    @category = Category.find(@plants["category_id"])
  end

  private

  def product_params
    params.require(:product).permit
  end
end
