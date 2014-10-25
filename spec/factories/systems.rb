FactoryGirl.define do
  factory :system do
    sequence( :schema ) { |n| "ms#{n}" }
    name { Faker::Company.name }
    uid { SecureRandom.hex(32) }
    secret { SecureRandom.hex(32) }
    locked false
    timeout { Date.current }
    autorise { false }

    factory :sys_is_forever do
      timeout nil
    end

    factory :sys_is_locked do
      locked true
    end

    factory :sys_is_timeout do
      timeout { 1.days.ago }
    end

    factory :sys_is_autorise do
      autorise { true }
    end
  end
end
