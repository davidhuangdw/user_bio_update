class User
  module Followable
    def follow_form_id
      "follow_form_#{id}"
    end

    def not_me?(other_user)
      id != other_user.id
    end

    def follow?(other_user)
      followed_users.include?(other_user)
    end

    def followed_by?(other_user)
      followers.include?(other_user)
    end

    def follow_relationship_for(other_user)
      follow_relationships.find_by_followed_id(other_user.id)
    end

    def follow!(other_user)
      follow_relationships.create!(followed_user:other_user)
    end

    def unfollow!(other_user)
      follow_relationships.where(followed_user:other_user).destroy
    end
  end
end