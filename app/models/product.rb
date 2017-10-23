class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  #relationship
	has_many :order_items

  #validates
  validates :title, :description, :price, presence: true
end
