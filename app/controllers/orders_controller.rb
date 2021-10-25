class OrdersController < ApplicationController
  before_action :authenticate_user, except: [:show, :index]

  def create
    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"]
    )
    if order.save
      render json: order
    else
      render json: { errors: order.errors.full_messages }, status: 408
    end
  end

  def show
    order_id = params[:id]
    order = current_user.orders.find_by(id: order_id)
    render json: order
  end

  def index
    order = current_user.orders
    render json: order
  end

end
