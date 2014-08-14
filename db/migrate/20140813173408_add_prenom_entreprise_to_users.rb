class AddPrenomEntrepriseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prenom, :string
    add_reference :users, :entreprise, polymorphic: true, index: true
  end
end
