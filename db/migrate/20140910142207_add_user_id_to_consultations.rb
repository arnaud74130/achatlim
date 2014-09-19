class AddUserIdToConsultations < ActiveRecord::Migration
  def change
    add_column :consultations, :user_id, :integer
  end
end
