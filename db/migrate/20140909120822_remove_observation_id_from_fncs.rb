class RemoveObservationIdFromFncs < ActiveRecord::Migration
  def change
  	remove_column :fncs, :observation_id, :integer
  end
end
