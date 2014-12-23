class User
  module BioChangeable
    extend ActiveSupport::Concern
    included do
      after_update do
        if @bio_changed
          bio_updates.create!(user_id:self, content:bio)
        end
      end
    end
    def bio=(content)
      @bio_changed = true if bio != content
      super
    end
  end
end