FactoryGirl.define do
  factory :user do |u|
    u.nom {Faker::Name.name}
    u.email { Faker::Internet.email }
    u.password "please123"
    u.telephone { Faker::PhoneNumber.phone_number }
    u.confirmed_at Time.now
    u.confirmation_sent_at Time.now
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
