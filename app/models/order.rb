class Order < ApplicationRecord

  belongs_to :product

  validates :quantity, numericality: { greater_than: 0 }
  validates :quantity, :product_id, numericality: true

  def subtotal
    product = Product.find_by(id: product_id)
    product.price * quantity
  end

  def tax
    subtotal * 0.09
  end

  def total
    tax + subtotal
  end

end
