# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :etablissement do
    nom {Faker::Company.name}
    code_adherent {Faker::Company.duns_number}
    telephone { Faker::PhoneNumber.phone_number }
    fax { Faker::PhoneNumber.phone_number }
    adresse_ligne1 {Faker::Address.street_address}  
    code_postal {Faker::Address.zip_code}
    ville {Faker::Address.city}
  end
end
