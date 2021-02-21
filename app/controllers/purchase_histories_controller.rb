class PurchaseHistoriesController < ApplicationController
    def index
        @purchaseHistory = Form.new(purchase_history_params)
        @product = Product.find(params[:product_id])
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
end
