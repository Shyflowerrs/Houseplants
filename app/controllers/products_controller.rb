class ProductsController < InheritedResources::Base
  def index
    @plants = Product.all.order("name DESC")
  end

  def new
    @product = Product.new
  end

  def sale
    @sales = Product.where("sale == True")
  end

  def product_params
    params.require(:product).permit(:name, :category_id, :keywords, :deep_keywords)
  end

  def search
    if params[:category].empty?
      search = "%#{params[:search]}%"
      @products = Product.where("name LIKE ? OR description LIKE ?",
                                search, search)
    else
      search = "%#{params[:search]}%"
      @products = Product.where("name LIKE ? AND category_id == ? OR description LIKE ? AND category_id == ?",
                                search, params[:category], search, params[:category])
      # @products = category.products
    end
    # @products = Product.all
  end

  def updated
    @updated = Product.where("updated_at > ?", 3.days.ago)
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
