class User < ApplicationRecord
  has_secure_password
  has_many :orders

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, presence: true, uniqueness: true
  
end
