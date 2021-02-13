class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:edit,:update]
  before_action :product, only: [:update,:edit,:show]

  def update
    if @product.update(product_params)
      redirect_to product_path(product.id)
    else
      render  :edit
    end
  end

  def edit
    redirect_to root_path unless current_user.id == @product.user.id
  end

  def show
  end

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def product_params
    params.require(:product).permit(:image, :productname, :explanation, :category_id, :state_id, :delivery_fee_id,
                                    :area_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def product
    @product = Product.find(params[:id])
  end
end
