class AddStatutToConsultations < ActiveRecord::Migration
  def change
    add_column :consultations, :statut, :boolean, default: true
  end
end
