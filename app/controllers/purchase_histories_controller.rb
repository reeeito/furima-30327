class PurchaseHistoriesController < ApplicationController
    def index
        @PurchaceHistory = PurchaceHistory.new
    end

    def create
        @sold = Sold.new(sold_params)
        if @sold.valid?
            @sold.save
            return redirect_to root_path
        else
            render 'index'
        end
    end

    private

    def sold_params
        params.permit(:user,:product)
    end
end
