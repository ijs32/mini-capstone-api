class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :is_discounted, :tax, :total, :supplier, :images, :product_categories
end
