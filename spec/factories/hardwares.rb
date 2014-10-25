FactoryGirl.define do
  factory :hardware do
    client
    hardware_code { Faker::SSN.ssn }
    activate { client.activate }
  end
end
