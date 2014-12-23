class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password_digest, :auth_token, :bio, :bio_update_count
end
