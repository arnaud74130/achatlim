class RemoveEtablissementToConsulations < ActiveRecord::Migration
  def change
  	remove_column :consultations, :etablissement_id, :integer
  end
end
