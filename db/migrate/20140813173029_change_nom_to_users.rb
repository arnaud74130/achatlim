class ChangeNomToUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :name, :nom 
  end
end
