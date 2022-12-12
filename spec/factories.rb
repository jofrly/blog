FactoryBot.use_parent_strategy = false

FactoryBot.define do
  factory :user do
    username { "admin" }
    password { "secretpassword" }
  end
end
