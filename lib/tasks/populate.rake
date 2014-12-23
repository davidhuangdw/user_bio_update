require 'populator'
require 'faker'

namespace :db do
  namespace :populate do
    desc "Add users"
    task users: :environment do
      30.times do
        User.create name: Faker::Name.name,
            password:'password',
            password_confirmation:'password'
      end
    end

    desc "Clean users"
    task clean: :environment do
      [User, Team].each(&:delete_all)
    end
  end
end