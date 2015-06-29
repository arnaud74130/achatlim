class AddEnCoursToConsultations < ActiveRecord::Migration
  def change
    add_column :consultations, :en_cours, :boolean
  end
end
