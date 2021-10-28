class CartedProductsController < ApplicationController
  def index
    carted_products = CartedProduct.find_by(status: "carted")
    render json: carted_products
  end
  def create
    carted_products = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: params[:order_id]
    )
    if carted_products.save
      render json: {message: "order created successfully"}, status: :created
    else
      render json: {errors: carted_products.errors.full_messages}, status: :bad_request
    end
  end
end
