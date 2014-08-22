# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :market do
    code {Faker::Code.ean}
    fournisseur
  end
end
