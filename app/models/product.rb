class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  #relationship
	has_many :order_items

  belongs_to :category

  #validates
  validates :title, :description, :price, presence: true

end
