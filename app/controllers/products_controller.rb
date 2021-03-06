class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def show
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    render json: product
  end

  def index
    if params[:category]
      category = Category.find_by(name: params[:category])
      products = category.products
    else
      products = Product.all
    end
    render json: products
  end

  def create
    product = Product.new(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      inventory: params["inventory"] || 0,
      supplier_id: params["supplier_id"]
    )
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages}, status: 406
    end
  end

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)

    product.name = params["name"] || product.name
    product.price = params["price"] || product.price
    product.description = params["description"] || product.description
    product.inventory = params["inventory"] || product.inventory
    product.supplier_id = params["supplier_id"] || product.supplier_id

    if product.save
      render json: product
    else
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
