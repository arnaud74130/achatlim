class CreateHoraireLivraisons < ActiveRecord::Migration
  def change
    create_table :horaire_livraisons do |t|
      t.references :point_livraison, index: true, foreign_key: true	
      t.string :jour
      t.time :debut
      t.time :fin

      t.timestamps null: false
    end
  end
end
