class AddPrenomToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prenom, :string
  end
end
