class PurchaseHistoriesController < ApplicationController
    def index
        @PurchaseHistory = PurchaseHistory.new
    end

    def create
        binding.pry
        @PurchaseHistory = PurchaseHistory.new(purchase_history_params)
        if @PurchaseHistory.valid?
            @PurchaseHistory.save
            return redirect_to root_path
        else
            render 'index'
        end
    end

    private

    def purchase_history_params
        params.permit(:user_id,:product_id).merge(user_id: current_user.id)
    end
end
