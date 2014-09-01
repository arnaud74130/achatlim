class AddEtatToFncs < ActiveRecord::Migration
  def change
    add_column :fncs, :etat, :boolean,default: true
  end
end
