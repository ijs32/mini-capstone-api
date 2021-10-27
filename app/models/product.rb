class Product < ApplicationRecord
  
  has_many :product_categories
  belongs_to :supplier
  has_many :orders
  has_many :images

  validates :price, numericality: true

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def urls
    Image_url.where(product_id: id)
  end

  def is_discounted
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
  
end
