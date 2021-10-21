class EmailValidator < ActiveModel::EmailValidator
  def validate(supplier)
    if user.email.exlude? ("@")
      user.errors.add :base, "does not contain @ sign"
    end
  end
end
class Supplier < ApplicationRecord
  has_many :products #does the same as def products

  validates :name, :phone_number, :email presence: true
  validates_with EmailValidator

  def products
    Product.where(supplier_id: id)
  end
end
