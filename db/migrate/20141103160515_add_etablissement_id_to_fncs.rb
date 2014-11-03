class AddEtablissementIdToFncs < ActiveRecord::Migration
  def change
    add_column :fncs, :etablissement_id, :integer
  end
end
