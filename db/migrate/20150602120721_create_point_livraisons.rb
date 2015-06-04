class CreatePointLivraisons < ActiveRecord::Migration
  def change
    create_table :point_livraisons do |t|
      t.string :adresse_ligne1
      t.string :adresse_ligne2
      t.string :adresse_cp
      t.string :adresse_ville
      t.string :adresse_commentaire
      t.boolean :is_principal
      t.references :etablissement, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
