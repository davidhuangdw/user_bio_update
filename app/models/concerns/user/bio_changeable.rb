class User
  module BioChangeable
    extend ActiveSupport::Concern
    included do
      after_update do
        if @old_content
          bio_updates.create!(user_id:self, content:@old_content)
        end
      end
    end
    def bio=(content)
      @old_content= bio if bio != content
      super
    end
  end
end