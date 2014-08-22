class AddConsultationToMarkets < ActiveRecord::Migration
  def change
    add_reference :markets, :consultation, index: true
  end
end
