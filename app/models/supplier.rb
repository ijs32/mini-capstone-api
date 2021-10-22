class Supplier < ApplicationRecord
  has_many :products #does the same as def products

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, :phone_number, :email, presence: true

  def products
    Product.where(supplier_id: id)
  end
end
