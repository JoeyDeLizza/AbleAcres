class Product < ApplicationRecord
  has_one_attached :pic
  validates :name, presence: true
  validates :price, presence: true
  validates :desc, presence: true
  validates :pic, presence: true
  
end
