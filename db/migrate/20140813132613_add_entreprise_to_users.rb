class AddEntrepriseToUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.references :entreprise, :polymorphic => true
    end
  end

  def down
    change_table :users do |t|
      t.remove_references :entreprise, :polymorphic => true
    end
  end
end
