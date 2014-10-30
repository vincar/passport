require 'ffaker'

FactoryGirl.define do
  factory :client do |c|
    name { Faker::Name.name }
    system
    activate { system.autorise }
    session_token nil
  end
end
