class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.string :code
      t.string :libelle
      t.date :debut
      t.date :fin
      t.references :etablissement, index: true

      t.timestamps
    end
  end
end
