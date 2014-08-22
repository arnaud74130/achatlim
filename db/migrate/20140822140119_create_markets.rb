class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :code
      t.references :fournisseur, index: true

      t.timestamps
    end
  end
end
