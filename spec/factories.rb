FactoryBot.use_parent_strategy = false

FactoryBot.define do
  factory :user do
    sequence(:username){|n| "admin#{n}" }
    password { "secretpassword" }
  end

  factory :post do
    user
    title { "title" }
    content { "content" }
  end
end
