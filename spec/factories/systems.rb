require 'ffaker'

FactoryGirl.define do
  factory :system do
    name { Faker::Company.name }
    uid { SecureRandom.hex(32) }
    secret { SecureRandom.hex(32) }
    locked false
    timeout { Date.current }
    autorise { false }

    trait :forver do
      timeout nil
    end

    trait :locked do
      locked true
    end

    trait :timeout do
      timeout { 1.days.ago }
    end

    trait :autorise do
      autorise { true }
    end
  end
end
