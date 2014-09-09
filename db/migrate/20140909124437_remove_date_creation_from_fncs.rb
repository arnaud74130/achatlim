class RemoveDateCreationFromFncs < ActiveRecord::Migration
  def change
  		remove_column :fncs, :date_creation, :date
  end
end
