class CreateJoinTablePointLivraisonsCaracteristisques < ActiveRecord::Migration
  def change
    create_join_table :point_livraisons, :caracteristique_livraisons do |t|
      # t.index [:point_livraison_id, :caracteristique_livraison_id]
      # t.index [:caracteristique_livraison_id, :point_livraison_id]
       t.boolean :is_ok
    end
  end
end
