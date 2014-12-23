class RelationshipSerializer < ActiveModel::Serializer
  attributes :id
  has_one :follower
  has_one :followed
end
