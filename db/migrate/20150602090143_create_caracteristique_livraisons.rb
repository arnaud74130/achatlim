class CreateCaracteristiqueLivraisons < ActiveRecord::Migration
  def change
    create_table :caracteristique_livraisons do |t|
      t.string :libelle

      t.timestamps null: false
    end
  end
end
