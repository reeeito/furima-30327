class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:edit,:update,:new,:create,:destory]
  before_action :product, only: [:update,:edit,:show,:destory]
  before_action :user, only: [:edit, :update, :destory]

  def update
    if @product.update(product_params)
      redirect_to product_path(product.id)
    else
      render  :edit
    end
  end

  def edit
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

  def destroy
    if product.destroy
      redirect_to root_path
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

  def user
    redirect_to root_path unless current_user.id == @product.user.id
  end
end
