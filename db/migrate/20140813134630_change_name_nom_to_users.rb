class ChangeNameNomToUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :name, :nom
  end
end
