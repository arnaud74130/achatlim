FactoryGirl.define do
  factory :user do
    nom {Faker::Name.name}
    email { Faker::Internet.email }
    password "please123"
    telephone { Faker::PhoneNumber.phone_number }
    confirmed_at Time.now
    confirmation_sent_at Time.now
    trait :fournisseur do # create :user, :fournisseur
     role :fournisseur
    end
    trait :admin do # create :user, :admin
     role :admin
    end
     trait :etablissement do # create :user, :admin
     role :etablissement
    end
  end
end
