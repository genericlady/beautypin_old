FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'password'

    trait :admin do
      role 'admin'
    end

    trait :owner do
      role 'owner'
    end
  end

  factory :owner, class: 'User' do
    email 'owner@gmail.com'
    password 'password'
    role 'owner'
  end

end
