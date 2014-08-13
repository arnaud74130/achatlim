# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fournisseur do
    nom "MyString"
    telephone "MyString"
    fax "MyString"
    adresse_ligne1 "MyString"
    adresse_ligne2 "MyString"
    code_postal "MyString"
    ville "MyString"
  end
end
