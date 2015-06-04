class CreateJoinTablePointLivraisonsFamilleSegments < ActiveRecord::Migration
  def change
    create_join_table :point_livraisons, :famille_segments do |t|
      # t.index [:point_livraison_id, :famille_segment_id]
      # t.index [:famille_segment_id, :point_livraison_id]
    end
  end
end
