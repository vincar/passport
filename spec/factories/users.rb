require 'ffaker'

FactoryGirl.define do
  factory :user do
    system
    username { Faker::Name.last_name }
    password { '123456' }
    email { Faker::Internet.email }
  end
end