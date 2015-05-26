class CreateJoinTableConsultationsFamilleSegments < ActiveRecord::Migration
  def change
    create_join_table :consultations, :famille_segments do |t|
       #t.index [:consultation_id, :famille_segment_id]
       #t.index [:famille_segment_id, :consultation_id]
    end
  end
end
