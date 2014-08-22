class CreateJoinTableEtablissementConsultaton < ActiveRecord::Migration
  def change
    create_join_table :etablissements, :consultations do |t|
      # t.index [:etablissement_id, :consultation_id]
      # t.index [:consultation_id, :etablissement_id]
    end
  end
end
