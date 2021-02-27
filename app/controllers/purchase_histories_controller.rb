class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[index create]
  before_action :user, only: %i[index create]

  def index
    @purchaseHistory = Form.new
  end

  def create
    @purchaseHistory = Form.new(purchase_history_params)
    if @purchaseHistory.valid?
      pay_item
      @purchaseHistory.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def user
    @product = Product.find(params[:product_id])
    if @product.user.id == current_user.id || @product.purchase_history
     redirect_to root_path
    end
  end

  def purchase_history_params
    params.require(:form).permit(:postal_code, :area_id, :municipaity, :address, :tel,:building_name, :user_id, :product_id, :purchase_history_id)
          .merge(user_id: current_user.id, token: params[:token], product_id: @product.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_history_params[:token],
      currency: 'jpy'
    )
  end
end
