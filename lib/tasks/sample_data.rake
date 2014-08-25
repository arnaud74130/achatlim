# rake db:populate
namespace :db do
    desc "Erase and fill database"
    task :populate => :environment do
        require 'faker'

        Rake::Task['db:reset'].invoke

        #  3 Administrateur (sans compter le compte par défaut rake db:seed)
        Rake::Task['db:seed'].invoke
        # 3.times do |f|
        #     FactoryGirl.create(:user, :admin)
        # end

        # # 10 visisteurs
        # 10.times do |f|
        #     FactoryGirl.create(:user)
        # end

        # # x Etablissements avec 3 u
        # 60.times do |f|
        #     entreprise = FactoryGirl.create(:etablissement, nbr_users: 3)
        # end

        # 300.times do |f|
        #     entreprise = FactoryGirl.create(:fournisseur) # par défaut 1 utilisateur
        # end

        10.times do |f|
            FactoryGirl.create(:consultation)
        end

    end
end
