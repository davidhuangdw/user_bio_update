class User < ActiveRecord::Base
  has_many :follow_relationships, class_name:'Relationship', foreign_key: 'follower_id'
  has_many :followed_users, through: :follow_relationships, source: :followed

  has_many :followed_relationships, class_name:'Relationship', foreign_key: 'followed_id'
  has_many :followers, through: :followed_relationships, source: :follower


  include Validatable
  has_secure_password

  include Tokenable
  before_create :generate_token

  include Followable

end
