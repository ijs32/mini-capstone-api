class SuppliersController < ApplicationController
  def index
    suppliers = Supplier.all
    render json: suppliers
  end
  def show
    id = params[:id]
    supplier = Supplier.find_by(id: id)
    render json: supplier
  end
  def create
    supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    supplier.save
    render json: supplier
  end
  def update
    id = params[:id]
    supplier = Supplier.find_by(id: :id)
    
    supplier.name = params[:name] || supplier.name
    supplier.email = params[:email] || supplier.email
    supplier.phone_number = params[:phone_number] || supplier.phone_number

    supplier.save
    render json: supplier
  end
end
