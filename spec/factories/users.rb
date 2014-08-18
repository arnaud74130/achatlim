FactoryGirl.define do
  factory :user do
    nom "Test User"
    email "test@example.com"
    password "please123"
    confirmed_at Time.now
    confirmation_sent_at Time.now
    trait :admin do
      role 'admin'
    end

  end
end
