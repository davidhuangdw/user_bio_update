class Relationship < ActiveRecord::Base
  belongs_to :followed_user, class_name: 'User', counter_cache: :followers_count
  belongs_to :follower, class_name:'User', counter_cache: :followeds_count
end
