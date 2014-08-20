namespace :db do
    desc "Erase and fill database"
    task :populate => :environment do
        require 'faker'

        Rake::Task['db:reset'].invoke

        # Create admin_user account
        Rake::Task['db:seed'].invoke
        4.times do |f|
            FactoryGirl.create(:user, :admin)
        end
        10.times do |f|
            FactoryGirl.create(:user)
        end

        # Création des fournisseurs
        # 400.times do |f|
        #     FactoryGirl.create(:fournisseur)
        # end
        60.times do |f|
            entreprise = FactoryGirl.create(:etablissement)
            utilisateur = FactoryGirl.create(:user, :etablissement)
            utilisateur.entreprise = entreprise
            utilisateur.save
        end

        300.times do |f|
            entreprise = FactoryGirl.create(:fournisseur)
            utilisateur = FactoryGirl.create(:user, :fournisseur)
            utilisateur.entreprise = entreprise
            utilisateur.save
        end



    end
end
