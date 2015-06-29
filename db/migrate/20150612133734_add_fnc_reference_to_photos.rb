class AddFncReferenceToPhotos < ActiveRecord::Migration
  def change
  	add_reference :photos, :fnc, index: true
  	add_foreign_key :photos, :fncs
  end
end
