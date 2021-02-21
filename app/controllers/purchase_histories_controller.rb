class PurchaseHistoriesController < ApplicationController
    before_action :authenticate_user!, only: [:index,:create]
    before_action :user, only: [:index,:create]

    def index
        @purchaseHistory = Form.new(purchase_history_params)
    end

    def create
        @purchaseHistory = Form.new(purchase_history_params)
        if @purchaseHistory.valid?
            @purchaseHistory.save
            return redirect_to root_path
        else
            render 'index'
        end
    end

    private

    def purchase_history_params
        params.permit(:postal_code,:area_id,:municipaity,:address,:tel,:user_id, :product_id, :purchase_history_id).merge(user_id: current_user.id)
    end

    def user
        @product = Product.find(params[:product_id])
        #redirect_to root_path unless current_user.id == @product.user.id
    end
end
