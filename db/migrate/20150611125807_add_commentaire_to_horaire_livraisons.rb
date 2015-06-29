class AddCommentaireToHoraireLivraisons < ActiveRecord::Migration
  def change
    add_column :horaire_livraisons, :commentaire, :string
  end
end
