class SoldsController < ApplicationController
    def index
        @sold = Sold.new
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
        params.permit(:postal_code,:area_id,:municipaity,:address,:building_name,:tel)
    end

end
