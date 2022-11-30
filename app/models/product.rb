class Product < ApplicationRecord
  has_many :orderables
  has_many :carts, through: :orderables
  has_one_attached :pic
  validates :name, presence: true
  validates :price, presence: true
  validates :desc, presence: true
  validates :pic, presence: true
  
end
