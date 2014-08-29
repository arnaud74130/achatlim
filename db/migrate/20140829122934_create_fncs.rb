class CreateFncs < ActiveRecord::Migration
  def change
    create_table :fncs do |t|
      t.date :date_creation
      t.string :raison_litige
      t.string :numero_commande
      t.string :produits
      t.date :commande_passee
      t.date :livraison_demandee
      t.string :lot_ou_dlc
     
      t.boolean :instruction_avoir
      t.boolean :instruction_facture
      t.boolean :instruction_surv_prepa
      t.boolean :instruction_reprendre
      t.boolean :instruction_relivrer
      t.string :instruction_autre
      
      # A,B,C
      t.string :respect_delais
      t.string :proprete_camion
      t.string :etat_emballage
      t.string :conformite_produit
      t.string :respect_dlc
      t.string :temperature_produit
      t.string :abs_tracabilite
      t.string :tarification

      t.references :market, index: true
      t.references :observation, index: true
      t.timestamps
    end
  end
end
