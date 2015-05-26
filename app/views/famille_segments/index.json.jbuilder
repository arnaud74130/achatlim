json.array!(@famille_segments) do |famille_segment|
  json.extract! famille_segment, :id, :libelle
  json.url famille_segment_url(famille_segment, format: :json)
end
