class ProductSerializer < ActiveModel::Serializer
  attributes  :id, :title, :category
  has_many :order_items
  belongs_to :category

end
