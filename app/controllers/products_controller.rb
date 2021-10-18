class ProductsController < ApplicationController
  def show
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    render json: product.as_json(methods: [:is_discounted, :tax, :total])
  end

  def index
    all = Product.all
    render json: all
  end

  def create
    product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"]
    )
    product.save
    render json: product.as_json
  end

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)

    product.name = params["name"] || product.name
    product.price = params["price"] || product.price
    product.image_url = params["image_url"] || product.image_url
    product.description = params["description"] || product.description

    product.save
    render json: product.as_json
  end 

  def destroy
    product_id = params["id"]
    product = Product.find_by(id: product_id)

    product.destroy

    render json: {message: "Product destroyed successfully"}
  end
end
