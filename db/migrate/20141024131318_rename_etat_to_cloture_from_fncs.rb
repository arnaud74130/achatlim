class RenameEtatToClotureFromFncs < ActiveRecord::Migration
  def change
  	rename_column :fncs, :etat, :cloturee
  	change_column_default(:fncs, :cloturee, false)
  end
end
