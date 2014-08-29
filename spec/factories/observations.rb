# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :observation do
    message {Faker::Lorem.paragraph}    
    # fnc nil
    # user nil
  end
end
