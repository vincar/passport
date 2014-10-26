FactoryGirl.define do
  factory :profile do
    user
    name { Faker::Name.last_name }
    admin false
    locked false
    login_token nil
    reset_password_token nil
    reset_password_created_at nil
    remember_created_at nil
  end
end
