class BioChange < ActiveRecord::Base
  belongs_to :user, counter_cache: :bio_update_count

  default_scope ->{order(created_at: :desc)}
  scope :for_user, ->(user){ where(user:user.followed_users) if user}
end
