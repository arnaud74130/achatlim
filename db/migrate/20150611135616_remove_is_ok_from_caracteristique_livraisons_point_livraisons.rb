class RemoveIsOkFromCaracteristiqueLivraisonsPointLivraisons < ActiveRecord::Migration
  def change
  	remove_column :caracteristique_livraisons_point_livraisons, :is_ok
  end
end
