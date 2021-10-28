class Product < ApplicationRecord
  
  has_many :product_categories
  has_many :categories, through: :product_categories
  belongs_to :supplier
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :images

  validates :price, numericality: true

  # def categories
  #   product_categories.map do |product_category|
  #     product_category.category
  #   end
  # end
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
