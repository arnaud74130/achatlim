class CreateFournisseurs < ActiveRecord::Migration
  def change
    create_table :fournisseurs do |t|
      t.string :nom
      t.string :telephone
      t.string :fax
      t.string :adresse_ligne1
      t.string :adresse_ligne2
      t.string :code_postal
      t.string :ville

      t.timestamps
    end
  end
end
