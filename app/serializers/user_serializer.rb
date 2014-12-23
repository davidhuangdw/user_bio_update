class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :bio_update_count
end
