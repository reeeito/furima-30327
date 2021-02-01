class ItemsController < ApplicationController
  def index
  end

  def new
    @products = Product.order("created_at CESC")
  end
end
