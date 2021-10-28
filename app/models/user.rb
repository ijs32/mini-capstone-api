class User < ApplicationRecord
  has_secure_password
  has_many :carted_products
  has_many :orders, through: :carted_products

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, presence: true, uniqueness: true
  
end
