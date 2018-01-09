class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :order_items

end
