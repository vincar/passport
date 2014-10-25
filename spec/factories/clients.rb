FactoryGirl.define do
  factory :client do |c|
    name { Faker::Name.name }
    system
    activate { system.autorise }
  end
end
