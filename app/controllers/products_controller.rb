class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:edit]

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to edit_product_path
    else
      render  :edit
    end
  end

  def edit
    @product = Product.find(params[:id])
    redirect_to root_path unless current_user.id == @product.user.id
  end

  def show
    @product = Product.find(params[:id])
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
end
