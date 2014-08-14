json.array!(@etablissements) do |etablissement|
  json.extract! etablissement, :id, :nom, :code_adherent, :telephone, :fax, :adresse_ligne1, :adresse_ligne2, :code_postal, :ville
  json.url etablissement_url(etablissement, format: :json)
end
