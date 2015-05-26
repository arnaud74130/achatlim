class CreateFamilleSegments < ActiveRecord::Migration
  def change
    create_table :famille_segments do |t|
      t.string :libelle

      t.timestamps null: false
    end
  end
end
