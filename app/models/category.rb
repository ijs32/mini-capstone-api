class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  # def products
  #   product_categories.map do |product_category|
  #     product_category.products
  #   end
  # end
end
