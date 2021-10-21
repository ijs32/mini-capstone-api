class ProductsController < ApplicationController
  def show
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    render json: product
  end

  def index
    all = Product.all
    render json: all
  end

  def create
    product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
      inventory: params["inventory"] || 0,
      supplier_id: params["supplier_id"]
    )
    if product.save
      render json: product
    elsif
      render json: {errors: product.errors.full_messages}, status: 406
    end
  end

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)

    product.name = params["name"] || product.name
    product.price = params["price"] || product.price
    product.image_url = params["image_url"] || product.image_url
    product.description = params["description"] || product.description
    product.inventory = params["inventory"] || product.inventory
    product.supplier_id = params["supplier_id"] || product.supplier_id

    if product.save
      render json: product
    elsif
      render json: {errors: product.errors.full_messages}, status: 406
    end
  end 

  def destroy
    product_id = params["id"]
    product = Product.find_by(id: product_id)

    product.destroy

    render json: {message: "Product destroyed successfully"}
  end
end
