class Product < ApplicationRecord
 after_create :default_image
  mount_uploader :image, ImageUploader
  #relationship
	has_many :order_items

  belongs_to :category

  #validates
  validates :title, :description, :price, :category, presence: true
	
	

end
