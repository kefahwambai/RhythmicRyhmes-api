class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :comment, :rating
  has_one :post
end
