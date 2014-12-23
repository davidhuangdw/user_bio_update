class User
  module Validatable
    extend ActiveSupport::Concern
    included do
      TEXT_MAX_LEN = 70
      validates :name, uniqueness:true, presence:true, length:{maximum:TEXT_MAX_LEN}
      validates :password, presence:true,
                length:{minimum:6, maximum:TEXT_MAX_LEN}, on: :create
    end
  end
end
