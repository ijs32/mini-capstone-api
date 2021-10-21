class Product < ApplicationRecord
  validates :price, numericality: true
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
