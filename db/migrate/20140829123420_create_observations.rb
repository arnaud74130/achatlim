class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.string :message
      t.references :fnc, index: true
	  t.references :user, index: true
      t.timestamps
    end
  end
end
