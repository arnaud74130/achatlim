#     AchatLim - Plateforme Collaborative Achat du Limousin
#     Copyright (C) 2014  Arnaud GARCIA - GCS EPSILIM
#
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.

#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.

#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
