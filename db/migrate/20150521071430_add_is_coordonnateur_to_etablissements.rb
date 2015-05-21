class AddIsCoordonnateurToEtablissements < ActiveRecord::Migration
  def change
    add_column :etablissements, :is_coordonnateur, :boolean, default: false     
  end
end
