json.array!(@fournisseurs) do |fournisseur|
  json.extract! fournisseur, :id, :nom, :telephone, :fax, :adresse_ligne1, :adresse_ligne2, :code_postal, :ville
  json.url fournisseur_url(fournisseur, format: :json)
end
