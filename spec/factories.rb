FactoryBot.use_parent_strategy = false

FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "admin#{n}" }
    password { 'secretpassword' }
  end

  factory :post do
    user
    title { 'title' }
    content { 'content' }
    sequence(:slug) { |n| "slug#{n}" }

    trait :with_long_content do
      content do
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et ' \
          'dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ' \
          'ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu ' \
          'fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt ' \
          'mollit anim id est laborum.'
      end
    end

    trait :with_new_lines_in_content do
      content do
        'a
b
c'
      end
    end
  end
end
