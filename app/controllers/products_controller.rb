class ProductsController < ApplicationController
  def bike
    bike = Product.first
    render json: bike
  end
end
