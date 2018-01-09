class UserSerializer < ActiveModel::Serializer
  attributes  :username, :email
  has_many :orders
end
